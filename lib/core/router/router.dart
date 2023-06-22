import 'package:flutter/material.dart';
import 'package:telegram_app/view/auth/auth_screen.dart';
import 'package:telegram_app/view/auth/otp_screen.dart';
import 'package:telegram_app/view/home/contacts_list_page.dart';
import 'package:telegram_app/view/home/home_page.dart';

class RouteGenerator {
// Singletone
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case 'auth':
        return _navigate(const AuthScreen());
      case 'otp':
        return _navigate(OtpScreen(
          otpCode: settings.arguments.toString(),
        ));
      case '/':
        return _navigate(const HomePage());
      case 'contacts':
        return _navigate(const ContactsPage());
      // default route home
      default:
        return _navigate(const HomePage());
    }
  }

  MaterialPageRoute _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}