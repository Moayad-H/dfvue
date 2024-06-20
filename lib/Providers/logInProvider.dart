import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/Repositories/authentication_repo.dart';
import 'package:dfvue/Repositories/user_repository.dart';
import 'package:dfvue/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogInProvider with ChangeNotifier {
  // UserModel? _currentUser;
  // User? get currentUser => _currentUser;
  bool isLoading = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isObscure = true;

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
  Future<void> resetPassword(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await authService.resetPassword(resetPasswordController.text);
      if (context.mounted) {
        GoRouter.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  "Email SENT, Check for instructions to reset your password")),
        );
      }
      if (context.mounted) {
        GoRouter.of(context).pushReplacement(AppRoutes.logInScreen);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.code)),
        );
      }
    }
  }

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
        if (context.mounted) {
          await Provider.of<ProfileProvider>(context, listen: false)
              .loadUserProfile();
        }
        if (context.mounted) {
          GoRouter.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("logged in")),
          );
        }
      }
      //GoRouter.of(context).go(AppRoutes.authPage);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        GoRouter.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.code)),
        );
      }
    }
  }
}
