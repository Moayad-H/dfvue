import 'package:dfvue/View/InitialScreen/initialScreen.dart';
import 'package:dfvue/View/StartScreen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const StartScreen();
          } else {
            return const InitialScreen();
          }
        },
      ),
    );
  }
}
