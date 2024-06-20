import 'dart:developer';
import 'package:dfvue/Repositories/user_repository.dart';
import 'package:dfvue/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Import the User model

class ProfileProvider with ChangeNotifier {
  bool isLoading = false;
  final UserProfileService _userProfileService = UserProfileService();
  static UserProfile? _userProfile;
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  UserProfile? get userProfile => _userProfile;

  Future<void> loadUserProfile() async {
    isLoading = true;
    notifyListeners();
    if (FirebaseAuth.instance.currentUser != null) {
      _userProfile = await _userProfileService.getUserProfile();
      nameController.text = _userProfile!.name;
      emailController.text = _userProfile!.email;
      log(_userProfile!.email.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile(context) async {
    showDialog(
        context: context,
        builder: (context) => const CircularProgressIndicator());

    isLoading = true;
    notifyListeners();
    try {
      _userProfile = await _userProfileService.updateUserProfile(
          {'email': emailController.text, 'name': nameController.text});
      FirebaseAuth.instance.currentUser!
          .verifyBeforeUpdateEmail(emailController.text);
      GoRouter.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'We have sent an email to the provided email address, please verify to complete update')));
    } on FirebaseAuthException catch (e) {
      SnackBar(content: Text(e.code));
    }
  }
}
