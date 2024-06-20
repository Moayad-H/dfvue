import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  static final theme = AppProvider(ThemeData.light());
  // Body text style
  static get bodyMediumErrorContainer =>
      theme.themeData.textTheme.bodyMedium!.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(1),
        fontSize: 15.fSize,
      );
  static get bodyMediumErrorContainer15 =>
      theme.themeData.textTheme.bodyMedium!.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(0.5),
        fontSize: 15.fSize,
      );
  static get bodyMediumErrorContainer15_1 =>
      theme.themeData.textTheme.bodyMedium!.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(0.9),
        fontSize: 15.fSize,
      );
  static get bodyMediumOnErrorContainer =>
      theme.themeData.textTheme.bodyMedium!.copyWith(
        color: theme.themeData.colorScheme.onErrorContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumOutfitErrorContainer =>
      theme.themeData.textTheme.bodyMedium!.outfit.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(0.7),
        fontSize: 15.fSize,
      );
  static get bodyMediumOutfitErrorContainer15 =>
      theme.themeData.textTheme.bodyMedium!.outfit.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(1),
        fontSize: 15.fSize,
      );
  static get bodyMediumOutfitErrorContainer15_1 =>
      theme.themeData.textTheme.bodyMedium!.outfit.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(1),
        fontSize: 15.fSize,
      );
  static get bodyMediumOutfitOnError =>
      theme.themeData.textTheme.bodyMedium!.outfit.copyWith(
        color: theme.themeData.colorScheme.onError,
        fontSize: 15.fSize,
      );
  static get bodyMediumPrimary =>
      theme.themeData.textTheme.bodyMedium!.copyWith(
        color: theme.themeData.colorScheme.primary,
        fontSize: 15.fSize,
      );
  static get bodySmall12 => theme.themeData.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallOutfitErrorContainer =>
      theme.themeData.textTheme.bodySmall!.outfit.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(0.7),
      );
  static get bodySmallOutfitErrorContainer12 =>
      theme.themeData.textTheme.bodySmall!.outfit.copyWith(
        color: theme.themeData.colorScheme.errorContainer,
        fontSize: 12.fSize,
      );
  static get bodySmallOutfitGray700 =>
      theme.themeData.textTheme.bodySmall!.outfit.copyWith(
        color: appTheme.gray700,
        fontSize: 12.fSize,
      );
  static get bodySmallOutfitWhiteA700 =>
      theme.themeData.textTheme.bodySmall!.outfit.copyWith(
        color: appTheme.whiteA700.withOpacity(0.7),
      );
  static get bodySmallPoppins =>
      theme.themeData.textTheme.bodySmall!.poppins.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallPoppinsErrorContainer =>
      theme.themeData.textTheme.bodySmall!.poppins.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(1),
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsLight =>
      theme.themeData.textTheme.bodySmall!.poppins.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallWhiteA700 =>
      theme.themeData.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.8),
      );
  // Headline text style
  static get headlineLargeAmber400 =>
      theme.themeData.textTheme.headlineLarge!.copyWith(
        color: appTheme.amber400,
      );
  // Inter text style
  static get interWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).inter;
  // Label text style
  static get labelLargeMulishPrimaryContainer =>
      theme.themeData.textTheme.labelLarge!.mulish.copyWith(
        color: theme.themeData.colorScheme.primaryContainer,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOutfitSecondaryContainer =>
      theme.themeData.textTheme.labelLarge!.outfit.copyWith(
        color: theme.themeData.colorScheme.secondaryContainer,
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleLargeGray10004 =>
      theme.themeData.textTheme.titleLarge!.copyWith(
        color: appTheme.gray10004,
      );
  static get titleLargeGray200e5 =>
      theme.themeData.textTheme.titleLarge!.copyWith(
        color: appTheme.gray200E5,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeGray800 =>
      theme.themeData.textTheme.titleLarge!.copyWith(
        color: appTheme.gray800,
      );
  static get titleLargeInterWhiteA700 =>
      theme.themeData.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargePrimaryContainer =>
      theme.themeData.textTheme.titleLarge!.copyWith(
        color: theme.themeData.colorScheme.primaryContainer.withOpacity(1),
      );
  static get titleLargeWhiteA700 =>
      theme.themeData.textTheme.titleLarge!.copyWith(
        color: Colors.white,
      );
  static get titleMediumGray5002 =>
      theme.themeData.textTheme.titleMedium!.copyWith(
        color: appTheme.gray5002,
      );
  static get titleSmallErrorContainer =>
      theme.themeData.textTheme.titleSmall!.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(1),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallMulishPrimaryContainer =>
      theme.themeData.textTheme.titleSmall!.mulish.copyWith(
        color: theme.themeData.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOutfit =>
      theme.themeData.textTheme.titleSmall!.outfit.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOutfitErrorContainer =>
      theme.themeData.textTheme.titleSmall!.outfit.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOutfitErrorContainerSemiBold =>
      theme.themeData.textTheme.titleSmall!.outfit.copyWith(
        color: theme.themeData.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRed600 => theme.themeData.textTheme.titleSmall!.copyWith(
        color: appTheme.red600,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get outfit {
    return copyWith(
      fontFamily: 'Outfit',
    );
  }

  TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
