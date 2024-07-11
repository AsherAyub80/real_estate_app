import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/page/loginOrRegister.dart';
import 'package:real_estate_app/screens/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          //if user login

          if (snapshot.hasData) {
            return HomePage();
          } else {
            //user not loggedin
            return Loginorregister();
          }
        },
      ),
    );
  }
}
