import 'dart:developer';

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

class ProfileProvider with ChangeNotifier {
  bool isLoading = false;
  final UserProfileService _userProfileService = UserProfileService();
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  Future<void> loadUserProfile(String uid) async {
    isLoading = true;
    notifyListeners();
    _userProfile = await _userProfileService.getUserProfile(uid);
    log(_userProfile!.email.toString());
    isLoading = false;
    notifyListeners();
  }
}
