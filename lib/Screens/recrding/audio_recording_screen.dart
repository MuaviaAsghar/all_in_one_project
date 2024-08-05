import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioRecordingScreen extends StatefulWidget {
  const AudioRecordingScreen({super.key});

  @override
  State<AudioRecordingScreen> createState() => _AudioRecordingScreenState();
}

late AudioRecorder audioRecorder;

class _AudioRecordingScreenState extends State<AudioRecordingScreen> {
  final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  String? recordingPath;
  bool isRecording = false;
  bool isPlaying = false;
  double totalDuration = 0;
  String? _filePath;
  double currentPosition = 0;
  @override
  void dispose() {
    audioPlayer.dispose();
    audioRecorder.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    final bool isPermissionGranted = await audioRecorder.hasPermission();
    if (!isPermissionGranted) {
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    // Generate a unique file name using the current timestamp
    String fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _filePath = '${directory.path}/$fileName';

    // Define the configuration for the recording
    const config = RecordConfig(
      // Specify the format, encoder, sample rate, etc., as needed
      encoder: AudioEncoder.aacLc, // For example, using AAC codec
      sampleRate: 44100, // Sample rate
      bitRate: 128000, // Bit rate
    );

    // Start recording to file with the specified configuration
    await audioRecorder.start(config, path: _filePath!);
    setState(() {
      isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    await audioRecorder.stop();
    setState(() {
      isRecording = false;
    });
  }

  Future<void> playRecording() async {
    if (_filePath != null) {
      await audioPlayer.setFilePath(_filePath!);
      totalDuration = audioPlayer.duration?.inSeconds.toDouble() ?? 0;

      audioPlayer.play();
      audioPlayer.positionStream.listen((position) {
        currentPosition = position.inSeconds.toDouble();
        if (currentPosition == totalDuration) {
          Future.delayed(
            const Duration(milliseconds: 1000),
            () async {
              await stopPlayback();
            },
          );
        }
      });
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> stopPlayback() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Recording Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: _filePath != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              if (_filePath != null)
                GestureDetector(
                  onTap: () async {
                    isPlaying ? stopPlayback() : playRecording();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: isPlaying ? Colors.red : Colors.green,
                      ),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Center(
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: MediaQuery.of(context).size.height * 0.1 / 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () async {
                  isRecording ? stopRecording() : startRecording();
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isRecording ? Colors.red : Colors.green,
                    ),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Center(
                      child: Icon(
                        isRecording ? Icons.stop : Icons.mic,
                        size: MediaQuery.of(context).size.height * 0.1 / 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
