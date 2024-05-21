import 'package:dfvue/Providers/theme_provider.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final themeProvider = ThemeProvider(ThemeData.light());
  await themeProvider.loadThemeFromPrefs();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => themeProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
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
        ],
        //initialRoute: AppRoutes.initialRoute,
        //routes: AppRoutes.routes,
      ),
    );
  }
}
