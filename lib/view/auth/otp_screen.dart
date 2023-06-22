import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:telegram_app/core/extensions/build_context_ext.dart';
import 'package:telegram_app/provider/otp_provider.dart';

class OtpScreen extends StatelessWidget {
  final String? otpCode;
  const OtpScreen({super.key, this.otpCode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("SuperApp"),
            centerTitle: true,
          ),
          body: Padding(
            padding:  EdgeInsets.only(top: context.height * 0.1),
            child: SizedBox(
              height: context.height * 0.4,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Please confirm sms code"),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.2),
                    child: Pinput(
                      controller: context.watch<OtpProvider>().pinputController,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      length: 5, //  pin code length
                      // default
                      defaultPinTheme: PinTheme(
                        textStyle: const TextStyle(fontSize: 16),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      // on focused
                      focusedPinTheme: PinTheme(
                        textStyle: const TextStyle(fontSize: 16),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      useNativeKeyboard: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}