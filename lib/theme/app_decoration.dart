import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray800, // Darkened gray color
      );
  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: appTheme.gray700, // Darkened gray color
      );
  static BoxDecoration get fillGray20001 => BoxDecoration(
        color: appTheme.gray700, // Darkened gray color
      );
  static BoxDecoration get fillGray30099 => BoxDecoration(
        color: appTheme.gray500, // Darkened gray color
      );
  static BoxDecoration get fillGray800 => BoxDecoration(
        color: appTheme.gray200, // Lighter gray color
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700, // White color
      );

  // Gradient decorations
  static BoxDecoration get gradientPrimaryToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.32, 0.97),
          end: Alignment(0.31, 1.3),
          colors: [
            theme.colorScheme.primary,
            appTheme.blueGray20000,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToOnPrimaryContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.26, 0.24),
          end: Alignment(1.1, 0.5),
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.onPrimaryContainer,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineErrorContainer => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.errorContainer.withOpacity(1),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineErrorContainer1 => BoxDecoration(
        color: appTheme.green700B2,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.errorContainer.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineErrorContainer2 => BoxDecoration();
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray40099,
        border: Border.all(
          color: appTheme.gray10003,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        border: Border.all(
          color: appTheme.whiteA700.withOpacity(0.8),
          width: 2.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get circleBorder19 => BorderRadius.circular(
        19.h,
      );
  static BorderRadius get circleBorder71 => BorderRadius.circular(
        71.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL50 => BorderRadius.vertical(
        bottom: Radius.circular(50.h),
      );
  static BorderRadius get customBorderBR110 => BorderRadius.only(
        bottomRight: Radius.circular(110.h),
      );
  static BorderRadius get customBorderTL110 => BorderRadius.only(
        topLeft: Radius.circular(110.h),
        bottomLeft: Radius.circular(30.h),
        bottomRight: Radius.circular(30.h),
      );
  static BorderRadius get customBorderTL30 => BorderRadius.only(
        topLeft: Radius.circular(30.h),
        topRight: Radius.circular(30.h),
        bottomLeft: Radius.circular(10.h),
        bottomRight: Radius.circular(10.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
