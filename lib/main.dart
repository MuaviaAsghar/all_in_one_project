import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'Screens/localization/translated_screen.dart';
import 'Screens/localization/translation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "en");
    localization.onTranslatedLanguage = ontranslatedLanguage;
  }

  ontranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  void initState() {
    configureLocalization();
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      title: 'Flutter Demo',
      home: const HomeScreen(),
    );
  }
}
