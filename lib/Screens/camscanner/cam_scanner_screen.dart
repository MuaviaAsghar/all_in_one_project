import 'package:flutter/material.dart';

import 'basic_pages.dart';
import 'custom_pages.dart';
import 'from_gallery_pages.dart';

class CamScannerScreen extends StatefulWidget {
  const CamScannerScreen({super.key});

  @override
  State<CamScannerScreen> createState() => _CamScannerScreenState();
}

class _CamScannerScreenState extends State<CamScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // * Basic example page
            ElevatedButton(
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const BasicPage(),
                ),
              ),
              child: const Text(
                'Basic example',
              ),
            ),

            // * Custom example page
            ElevatedButton(
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomPage(),
                ),
              ),
              child: const Text(
                'Custom example',
              ),
            ),

            // * From gallery example page
            ElevatedButton(
              onPressed: () => Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const FromGalleryPage(),
                ),
              ),
              child: const Text(
                'From gallery example',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
