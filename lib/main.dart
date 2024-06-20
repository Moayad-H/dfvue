import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:dfvue/Providers/SignUpProvider.dart';
import 'package:dfvue/Providers/logInProvider.dart';
import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/Providers/settingsProvider.dart';
import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  final appProvider = AppProvider(ThemeData.light());
  await appProvider.loadThemeFromPrefs();
  try {
    await ProfileProvider().loadUserProfile();
  } catch (e) {
    log('Error in loading profile from main: $e');
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VoiceRecognitionProvider()),
        ChangeNotifierProvider(create: (_) => appProvider),
        ChangeNotifierProvider(create: (_) => LogInProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(),
      // ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) => MaterialApp.router(
        // routerDelegate: AppRoutes.router.routerDelegate,
        // routeInformationParser: AppRoutes.router.routeInformationParser,
        // routeInformationProvider: AppRoutes.router.routeInformationProvider,
        routerConfig: AppRoutes.router,
        themeMode: //
            //ThemeMode.dark,
            provider.themeSelected,
        theme: ThemeHelper().lightThemeData(),
        darkTheme: ThemeHelper().darkThemeData(),

        title: 'DfVue',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        locale: provider.locale,

        //initialRoute: AppRoutes.initialRoute,
        //routes: AppRoutes.routes,
      ),
    );
  }
}
