import 'package:all_in_one_project/Screens/camscanner/cam_scanner_screen.dart';
import 'package:all_in_one_project/Screens/finger_print_screen.dart';
import 'package:all_in_one_project/Screens/localization/translated_screen.dart';
import 'package:all_in_one_project/Screens/qr_code/cam_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
    currentlocale = flutterLocalization.currentLocale?.languageCode ?? 'en';
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
      default:
        return "English";
    }
  }

  void setLocale(String? value) {
    if (value == null) return;
    flutterLocalization.translate(value);
    setState(() {
      currentlocale = value;
    });
  }

  void navigateToScreen(Widget route, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  final constantPadding = const EdgeInsets.all(20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleData.title.getString(context)),
        centerTitle: true,
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Drawer(
          child: DropdownButton<String>(
            icon: const Icon(Icons.language),
            value: currentlocale,
            hint: Text(getLocaleName()),
            dropdownColor: Colors.blue,
            onChanged: setLocale,
            items: const [
              DropdownMenuItem(
                value: "en",
                child: Text("English"),
              ),
              DropdownMenuItem(
                value: "de",
                child: Text("Dutch"),
              ),
              DropdownMenuItem(
                value: "fr",
                child: Text("French"),
              ),
              DropdownMenuItem(
                value: "ps",
                child: Text("Pashto"),
              ),
            ],
          ),
        ),
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
          ],
        ),
      ),
    );
  }
}
