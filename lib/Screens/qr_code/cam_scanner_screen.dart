import 'package:all_in_one_project/Screens/qr_code/create_qr_code.dart';
import 'package:all_in_one_project/Screens/qr_code/scan_qr_code.dart';
import 'package:flutter/material.dart';

class QrCodeScan extends StatefulWidget {
  const QrCodeScan({super.key});

  @override
  State<QrCodeScan> createState() => _QrCodeScanState();
}

class _QrCodeScanState extends State<QrCodeScan> {
  navigateToScreen(Widget route, context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          navigateToScreen(const ScanQrCode(), context);
                        },
                        iconSize: 50,
                        icon: const Icon(Icons.qr_code_scanner)),
                    const Text(
                      "Scan QR Code",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateToScreen(const CreateQrCode(), context);
                      },
                      icon: const Icon(Icons.qr_code),
                      iconSize: 50,
                    ),
                    const Text(
                      "Create QR Code",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
