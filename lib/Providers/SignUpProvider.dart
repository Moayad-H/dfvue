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

class SignupProvider with ChangeNotifier {
  // UserModel? _currentUser;
  // User? get currentUser => _currentUser;
  bool isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController spokenLanguageController =
      TextEditingController();

  final TextEditingController subtitleLanguageController =
      TextEditingController();

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final AuthService authService = AuthService();
  final UserProfileService userProfileService = UserProfileService();

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

  Future<void> signUp(context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      User? user = await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      if (user != null) {
        UserProfile userProfile = UserProfile(
          uid: user.uid,
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
        await userProfileService.createUserProfile(userProfile);

        isLoading = false;
        notifyListeners();
        SnackBar(content: Text('Success'));
        // Navigate to home screen or profile screen
        GoRouter.of(context).push(AppRoutes.logInScreen);
      } else {
        isLoading = false;
        notifyListeners();
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up')),
        );
      }
    }
  }
}
