import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class CreateQrCode extends StatefulWidget {
  const CreateQrCode({super.key});

  @override
  State<CreateQrCode> createState() => _CreateQrCodeState();
}

String? qrData;

QrCode qrCode = QrCode.fromData(
  data: qrData!,
  errorCorrectLevel: QrErrorCorrectLevel.H,
);
QrImage qrImage = QrImage(qrCode);

class _CreateQrCodeState extends State<CreateQrCode> {
  @override
  void dispose() {
    String? qrData;
    QrCode qrCode = QrCode.fromData(
      data: qrData!,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );
    QrImage(qrCode);
    // Dispose of any controllers or resources here if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gnrate Qr code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (qrData != null) PrettyQrView(qrImage: qrImage),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      qrData = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
