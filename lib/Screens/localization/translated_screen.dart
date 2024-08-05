import 'package:flutter_localization/flutter_localization.dart';

List<MapLocale> LOCALES = [
  const MapLocale("en", LocaleData.EN),
  const MapLocale("de", LocaleData.DE),
  const MapLocale("fr", LocaleData.FR),
  const MapLocale("ps", LocaleData.PS)
];

mixin LocaleData {
  static const String title = 'title';

  static const String videoRecordingScreenAppBar = 'videoRecordingScreen';

  static const Map<String, dynamic> EN = {
    title: 'Localizations',
    videoRecordingScreenAppBar: "Video Recording Screen"
  };

  static const Map<String, dynamic> DE = {
    title: 'Lokalisierungen',
    videoRecordingScreenAppBar: "Video-opnamescherm"
  };
  static const Map<String, dynamic> FR = {
    title: 'Localisations',
    videoRecordingScreenAppBar: "Écran d’enregistrement vidéo"
  };
  static const Map<String, dynamic> PS = {
    title: 'ځایی کول',
    videoRecordingScreenAppBar: "ویدیو ثبت پرده"
  };
}
