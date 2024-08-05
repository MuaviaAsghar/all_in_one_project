import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'video_page.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _isLoading = true;
  CameraController? controller;
  bool _isRecording = false;
  bool frontCamera = true;
  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    final back = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    controller =
        CameraController(frontCamera ? back : front, ResolutionPreset.max);
    await controller?.initialize();
    setState(() => _isLoading = false);
  }

  changeCamera() {
    setState(() {
      frontCamera = !frontCamera;
      _initCamera();
    });
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await controller?.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file!.path),
      );
      if (context.mounted) {
        Navigator.push(context, route);
      }
    } else {
      await controller?.prepareForVideoRecording();
      await controller?.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ))
        : Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CameraPreview(controller!),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                        child: Icon(_isRecording ? Icons.stop : Icons.circle),
                        onPressed: () => _recordVideo(),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.change_circle),
                        onPressed: () => changeCamera(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
