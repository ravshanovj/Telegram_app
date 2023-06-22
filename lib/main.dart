import 'package:flutter/material.dart';
import 'package:telegram_app/core/router/router.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.router.onGenerate,
      initialRoute: 'auth',
    );
  }
}
