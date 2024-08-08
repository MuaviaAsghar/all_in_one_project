import 'package:all_in_one_project/Screens/localization/translated_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'custom_dropdown.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  bool isDropdownOpen = false;

  void _toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
    print(" _toggleDropdown");
  }

  void _setLocale(String locale) {
    setState(() {
      // Update locale in your application
      FlutterLocalization.instance.translate(locale);
      isDropdownOpen = false; // Close the dropdown
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleData.translationScreenTitle.getString(context)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  color: const Color.fromARGB(255, 190, 178, 178),
                  child: Text(
                    LocaleData.translatedScreenText.getString(context),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 24),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).height * 0.1,
                child: InkWell(
                    onTap: _toggleDropdown, child: const CustomDropDown()),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  if (isDropdownOpen)
                    Positioned(
                      top:
                          -50, // Adjust this value to position the clip paths correctly
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ(1.5708), // 90 degrees in radians
                            child: CustomClipPath(
                              width:
                                  MediaQuery.sizeOf(context).height * 0.1 / 2,
                              height: 100,
                              color: Colors.white,
                            ),
                          ),
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ(-1.5708), // -90 degrees in radians
                            child: CustomClipPath(
                              width:
                                  MediaQuery.sizeOf(context).height * 0.1 / 2,
                              height: 100,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    height: isDropdownOpen
                        ? MediaQuery.sizeOf(context).height * 0.12
                        : 0,
                    child: AnimatedOpacity(
                      opacity: isDropdownOpen ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 600),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: FlagsDropDown(
                            setLocale: _setLocale,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomClipPath({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedClipper(),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * .7);
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: const Radius.elliptical(10, 10),
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
