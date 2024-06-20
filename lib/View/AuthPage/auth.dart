import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/View/InitialScreen/initialScreen.dart';
import 'package:dfvue/View/LanguageScreen/languageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder:
            (BuildContext context, ProfileProvider profile, Widget? child) =>
                StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const LanguageScreen();
            } else {
              return const InitialScreen();
            }
          },
        ),
      ),
    );
  }
}
