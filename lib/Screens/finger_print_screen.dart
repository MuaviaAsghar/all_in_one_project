import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({super.key});

  @override
  State<FingerPrintScreen> createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
  bool isAuthenticated = false;
  final LocalAuthentication auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fingerprint Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Account Balance",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  if (isAuthenticated)
                    const Text(
                      "69000 \$",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  if (!isAuthenticated)
                    const Text(
                      "*******",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                ],
              ),
            ),
          ),
          if (!isAuthenticated)
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: IconButton(
                onPressed: () async {
                  if (isAuthenticated == false) {
                    log("is authticatd calld");
                    bool canAuthenticateWithBiometrics =
                        await auth.canCheckBiometrics;
                    if (canAuthenticateWithBiometrics) {
                      try {
                        bool didAuthenticate = await auth.authenticate(
                            localizedReason: "Please apni ungli daalo,",
                            options: const AuthenticationOptions(
                                biometricOnly: true));
                        setState(() {
                          isAuthenticated = didAuthenticate;
                        });
                      } catch (e) {
                        print(e);
                      }
                    }
                  } else {
                    log("else calld");

                    setState(() {
                      isAuthenticated = false;
                    });
                  }
                },
                icon: const Icon(Icons.fingerprint),
                iconSize: 60,
              ),
            ),
        ],
      ),
    );
  }
}
