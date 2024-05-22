import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static Color primaryColor = Color(0xff006ed4);
  static Color darkPrimaryColor = Color(0xff004ec2);
  static const Color redErrorColor = Color(0xffde0a4a);
  static const Color offWhite = Color(0xFFE8E8E8);
  static const Color greyColor = Color(0xFF939292);
  static const Color black = Color(0xFF1E1E1E);
  static const Color white = Colors.white;
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color underDevelopment = Color(0xFF414141);
  static Color cardColor = Color(0xff3B82F6);
  static const String lexendFont = 'Lexend';
  static const Color grey = Color(0xFFE0E0E0);
  static const Color lightGrey = Colors.grey;
  static const Color border = Color(0xFFEDEDED);
  static const Color lightBlue = Color(0xFFFAFAFA);
  static const Color divider = Color(0xFFF3F3F3);
  static const Color customContainer = Color(0xFFE7E7E7);
  static const Color purple = Color(0xFF6A00D4);
  static const Color pink = Color(0xFFcc3fa4);
  static const Color lightGreen = Color(0xFF19B791);
  static const Color whiteSmoke = Color(0xFFE4EDFB);
  static const Color greyBorder = Color(0xFFF7F7F7);
  static const Color vibrantBlue = Color(0xFF4DAAFF);

  static setPinkMode(bool value) {
    if (value) {
      primaryColor = AppStyle.pink;
      darkPrimaryColor = AppStyle.pink;
      cardColor = AppStyle.pink;
    } else {
      primaryColor = const Color(0xff006ed4);
      darkPrimaryColor = const Color(0xff004ec2);
      cardColor = const Color(0xff3B82F6);
    }
  }

  static ThemeData lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppStyle.white,
      shape: RoundedRectangleBorder(borderRadius: bottomSheetBorderRadius),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: lexendFont,
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: black,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: greyColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: white,
        fontSize: 14.spMin,
        fontWeight: FontWeight.w400,
        fontFamily: lexendFont,
        height: 0.10,
      ),
      titleLarge: TextStyle(
        color: black,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w200,
      ),
      labelSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        color: black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w200,
        color: white,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      titleMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      displayLarge: TextStyle(
        color: black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  static ThemeData pinklightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppStyle.white,
      shape: RoundedRectangleBorder(borderRadius: bottomSheetBorderRadius),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: lexendFont,
    primarySwatch: Colors.pink,
    primaryColor: pink,
    cardColor: pink,
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: black,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: greyColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: white,
        fontSize: 14.spMin,
        fontWeight: FontWeight.w400,
        fontFamily: lexendFont,
        height: 0.10,
      ),
      titleLarge: TextStyle(
        color: black,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w200,
      ),
      labelSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        color: black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w200,
        color: white,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      titleMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      displayLarge: TextStyle(
        color: black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  static BorderRadiusGeometry bottomSheetBorderRadius = BorderRadius.only(
    topRight: Radius.circular(24.r),
    topLeft: Radius.circular(24.r),
  );
  static BorderRadius defaultBorderRadius = BorderRadius.circular(34.r);
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
}
