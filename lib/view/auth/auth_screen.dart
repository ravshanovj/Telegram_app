import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram_app/core/extensions/build_context_ext.dart';
import 'package:telegram_app/provider/auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Telegram"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.05,vertical: context.height * 0.1),
            child: SizedBox(
              width: double.infinity,
              height: context.height * 0.4,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: context.height * 0.1,
                  child: const Center(
                      child: Text(
                    "Your Phone",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ))),
              SizedBox(
                  width: double.infinity,
                  height: context.height * 0.1,
                  child: const Center(
                      child: Text(
                    "Please confirm your country code and enter your phone number.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ))),
              TextFormField(
                controller: Provider.of<AuthProvider>(context)
                    .phoneNumberController,
                decoration: InputDecoration(
                  prefixIcon: SizedBox(
                    width: context.width * 0.35,
                    child: SizedBox(
                      width: context.width * 0.35,
                      child: const IntrinsicHeight(
                        child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "+998",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff7E7F80)),
                              ),
                              VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              )
                            ]),
                      ),
                    ),
                  ),
                  hintText: "Your phone number",
                  hintStyle: const TextStyle(color: Color(0xff7E7F80)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.blueAccent)),
                ),
              )
            ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'otp', arguments: '12345');
            },
            child: const Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}