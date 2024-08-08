import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  Future<void> _saveLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', locale);
  }

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

  void setLocale(String? value) {
    if (value == null) return;
    flutterLocalization.translate(value);
    setState(() {
      currentlocale = value;
      _saveLocale(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: AlignmentDirectional(15, 0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Language',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1, 0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}

class FlagsDropDown extends StatelessWidget {
  final void Function(String locale) setLocale;

  const FlagsDropDown({super.key, required this.setLocale});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setLocale('en');
          },
          child: Flag.fromCode(FlagsCode.GB, height: 20, width: 20),
        ),
        InkWell(
          onTap: () {
            setLocale('fr');
          },
          child: Flag.fromCode(FlagsCode.FR, height: 20, width: 20),
        ),
        InkWell(
          onTap: () {
            setLocale('de');
          },
          child: Flag.fromCode(FlagsCode.DE, height: 20, width: 20),
        ),
        InkWell(
          onTap: () {
            setLocale('ur');
          },
          child: Flag.fromCode(FlagsCode.PK, height: 20, width: 20),
        ),
        InkWell(
          onTap: () {
            setLocale('ps');
          },
          child: Flag.fromCode(FlagsCode.AF, height: 20, width: 20),
        ),
      ],
    );
  }
}
