import 'package:device_preview/device_preview.dart';
import 'package:dfvue/Providers/SignUpProvider.dart';
import 'package:dfvue/Providers/logInProvider.dart';
import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  final appProvider = AppProvider(ThemeData.light());
  await appProvider.loadThemeFromPrefs();
  try {
    await ProfileProvider().loadUserProfile();
  } catch (e) {}

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VoiceRecognitionProvider()),
        ChangeNotifierProvider(create: (_) => appProvider),
        ChangeNotifierProvider(create: (_) => LogInProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
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
        theme: theme,
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
