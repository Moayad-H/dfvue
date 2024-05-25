import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dfvue/Repositories/authentication_repo.dart';
import 'package:dfvue/Repositories/user_repository.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import the User model
import 'dart:convert';

class LogInProvider with ChangeNotifier {
  // UserModel? _currentUser;
  // User? get currentUser => _currentUser;
  bool isLoading = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isObscure = true;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final AuthService authService = AuthService();
  final UserProfileService userProfileService = UserProfileService();
  void changeObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
  // Future<void> createUser({
  //   required String username,
  //   required String password,
  //   //required String email,
  //   required String phoneNumber,
  //   //required String spokenLanguage,
  //   //required String subtitleLanguage,
  // }) async {
  //   User newUser = User(
  //     username: username,
  //     password: password,
  //     //  email: email,
  //     phoneNumber: phoneNumber,
  //     //spokenLanguage: spokenLanguage,
  //     //subtitleLanguage: subtitleLanguage,
  //   );

  //   _currentUser = newUser;

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('user', newUser.toJson());

  //   notifyListeners();
  // }

  // Future<void> loadUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userJson = prefs.getString('user');

  //   if (userJson != null) {
  //     _currentUser = User.fromJson(userJson);
  //     notifyListeners();
  //   }
  // }

  // Future<bool> login(String username, String password) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userJson = prefs.getString('user');

  //   if (userJson != null) {
  //     User storedUser = User.fromJson(userJson);
  //     if (storedUser.username == username && storedUser.password == password) {
  //       _currentUser = storedUser;
  //       notifyListeners();
  //       return true;
  //     }
  //   }
  //   return false;
  // }
  final formKey = GlobalKey<FormState>();

  Future<void> logIn(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
      if (context.mounted && FirebaseAuth.instance.currentUser == null) {
        GoRouter.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error, Check your credentials')),
        );
      } else {
        GoRouter.of(context).pop();
        const SnackBar(content: Text('Logged In'));
      }
      //GoRouter.of(context).go(AppRoutes.authPage);
    } on FirebaseAuthException catch (e) {
      GoRouter.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.code)),
      );
    }
  }
}
