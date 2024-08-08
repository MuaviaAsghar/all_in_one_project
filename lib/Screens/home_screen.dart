import 'package:all_in_one_project/Screens/camscanner/cam_scanner_screen.dart';
import 'package:all_in_one_project/Screens/finger_print_screen.dart';
import 'package:all_in_one_project/Screens/qr_code/cam_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/translation_screen.dart';
import 'recrding/audio_recording_screen.dart';
import 'recrding/video_recording_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlutterLocalization flutterLocalization;
  late String currentlocale;

  @override
  void initState() {
    super.initState();
    flutterLocalization = FlutterLocalization.instance;
    _loadLocale();
  }

  void _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentlocale = prefs.getString('locale') ??
          flutterLocalization.currentLocale?.languageCode ??
          'en';
    });
    flutterLocalization.translate(currentlocale);
  }

  String getLocaleName() {
    switch (currentlocale) {
      case "en":
        return "English";
      case "de":
        return "Dutch";
      case "fr":
        return "French";
      case "ps":
        return "Pashto";
      case "ur":
        return "Urdu";
      default:
        return "English";
    }
  }

  void navigateToScreen(Widget route, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  final constantPadding = const EdgeInsets.all(20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: constantPadding,
              child: ElevatedButton(
                onPressed: () {
                  navigateToScreen(const AudioRecordingScreen(), context);
                },
                child: const Text("Navigate To Audio Recording Screen"),
              ),
            ),
            Padding(
              padding: constantPadding,
              child: ElevatedButton(
                onPressed: () {
                  navigateToScreen(const FingerPrintScreen(), context);
                },
                child: const Text("Navigate To Finger Print Screen"),
              ),
            ),
            Padding(
              padding: constantPadding,
              child: ElevatedButton(
                onPressed: () {
                  navigateToScreen(const QrCodeScan(), context);
                },
                child: const Text("Navigate to Scan QR Code"),
              ),
            ),
            Padding(
              padding: constantPadding,
              child: ElevatedButton(
                onPressed: () {
                  navigateToScreen(const VideoRecordingScreen(), context);
                },
                child: const Text("Navigate to Video Recording Screen"),
              ),
            ),
            Padding(
              padding: constantPadding,
              child: ElevatedButton(
                onPressed: () {
                  navigateToScreen(const CamScannerScreen(), context);
                },
                child: const Text("Navigate to Cam Scanner Screen"),
              ),
            ),
            Padding(
              padding: constantPadding,
              child: ElevatedButton(
                onPressed: () {
                  navigateToScreen(const TranslationScreen(), context);
                },
                child: const Text("Navigate to Translation Screen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
