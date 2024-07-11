import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/login_screen.dart';
import 'package:real_estate_app/screens/sign_up_screen.dart';

class Loginorregister extends StatefulWidget {
  const Loginorregister({super.key});

  @override
  State<Loginorregister> createState() => _LoginorregisterState();
}

class _LoginorregisterState extends State<Loginorregister> {
  bool showLoginePage = true;

  void togglepage() {
    setState(() {
      showLoginePage = !showLoginePage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginePage) {
      return LoginScreen(
        onTap: togglepage,
      );
    } else {
      return SignUpScreen(
        onTap: togglepage,
      );
    }
  }
}
