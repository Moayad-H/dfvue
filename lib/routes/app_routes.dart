import 'package:dfvue/View/AuthPage/auth.dart';
import 'package:dfvue/View/ForgotPassword/forgot_password_screen.dart';
import 'package:dfvue/View/InitialScreen/initialScreen.dart';
import 'package:dfvue/View/LanguageScreen/languageScreen.dart';
import 'package:dfvue/View/LogIn/logInScreen.dart';
import 'package:dfvue/View/ProfileScreen/profile_screen.dart';
import 'package:dfvue/View/SavedConvo/transcriptionScreen.dart';
import 'package:dfvue/View/SignUp/sign_up_screen.dart';
import 'package:dfvue/View/StartScreen/start_screen.dart';
import 'package:dfvue/View/VoiceRecognition/voice_recognition_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String authPage = '/';
  static const String signUpScreen = '/sign_up_screen';

  static const String transcriptionScreen = '/transcription';

  static const String userProfileScreen = '/user_profile_screen';

  static const String microphoneScreen = '/microphone_screen';

  static const String languageScreen = '/language_screen';

  static const String logInScreen = '/log_in_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String checkEmailsScreen = '/check_emails_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String startScreen = '/start_screen';

  static const String voiceRecognitionScreen = '/voice_recognition_screen';

  static const String voiceRecognitiontwoPage = '/voice_recognitiontwo_page';

  static const String voiceRecognitiontwoContainerScreen =
      '/voice_recognitiontwo_container_screen';

  static const String editSettingsScreen = '/edit_settings_screen';

  static const String editColorsPage = '/edit_colors_page';

  static const String editFontsPage = '/edit_fonts_page';

  static const String initScreen = '/init_screen';

  static const String otpVerifcationScreen = '/otp_verifcation_screen';

  static const String submitOtpScreen = '/submit_otp_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  // static Map<String, WidgetBuilder> get routes => {
  //       signUpScreen: SignUpScreen.builder,
  //       templatesScreen: TemplatesScreen.builder,
  //       profileEditScreen: ProfileEditScreen.builder,
  //       microphoneScreen: MicrophoneScreen.builder,
  //       languageScreen: LanguageScreen.builder,
  //       logInScreen: LogInScreen.builder,
  //       resetPasswordScreen: ResetPasswordScreen.builder,
  //       checkEmailsScreen: CheckEmailsScreen.builder,
  //       newPasswordScreen: NewPasswordScreen.builder,
  //       startScreen: StartScreen.builder,
  //       voiceRecognitionScreen: VoiceRecognitionScreen.builder,
  //       voiceRecognitiontwoContainerScreen:
  //           VoiceRecognitiontwoContainerScreen.builder,
  //       editSettingsScreen: EditSettingsScreen.builder,
  //       iphone1314TwoScreen: Iphone1314TwoScreen.builder,
  //       otpVerifcationScreen: OtpVerifcationScreen.builder,
  //       submitOtpScreen: SubmitOtpScreen.builder,
  //       appNavigationScreen: AppNavigationScreen.builder,
  //       initialRoute: SignUpScreen.builder
  //     };
  static var globalNavKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    initialLocation: authPage,
    debugLogDiagnostics: true,
    navigatorKey: globalNavKey,
    routes: <RouteBase>[
      GoRoute(
        path: authPage,
        builder: (BuildContext context, GoRouterState state) =>
            const AuthPage(),
      ),
      GoRoute(
        path: initScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const InitialScreen(),
      ),
      GoRoute(
        path: signUpScreen,
        builder: (BuildContext context, GoRouterState state) => SignUpScreen(),
      ),
      GoRoute(
        path: logInScreen,
        builder: (BuildContext context, GoRouterState state) => LogInScreen(),
      ),
      // GoRoute(
      //   path: otpVerifcationScreen,
      //   builder: (BuildContext context, GoRouterState state) =>
      //   const OtpVerifcationScreen(),
      // ),
      GoRoute(
        path: resetPasswordScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const ForgotPasswordScreen(),
      ),
      // GoRoute(
      //   path: checkEmailsScreen,
      //   builder: (BuildContext context, GoRouterState state) =>
      //   const CheckEmailsScreen(),
      // ),
      GoRoute(
        path: languageScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const LanguageScreen(),
      ),
      // GoRoute(
      //   path: microphoneScreen,
      //   builder: (BuildContext context, GoRouterState state) =>
      //   const MicrophoneScreen(),
      // ),
      GoRoute(
        path: startScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const StartScreen(),
      ),
      GoRoute(
        path: voiceRecognitionScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const VoiceRecognitionScreen(),
      ),
      GoRoute(
        path: transcriptionScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const TranscriptionScreen(),
      ),
      GoRoute(
        path: userProfileScreen,
        builder: (BuildContext context, GoRouterState state) =>
            UserProfileScreen(),
      ),
    ],
  );
}
