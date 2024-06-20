import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dfvue/app_export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  });

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 4,
        keyboardType: TextInputType.number,
        textStyle:
            textStyle ?? CustomTextStyles.bodyMediumOutfitErrorContainer15_1,
        hintStyle:
            hintStyle ?? CustomTextStyles.bodyMediumOutfitErrorContainer15_1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 42.h,
          fieldWidth: 42.h,
          shape: PinCodeFieldShape.circle,
          inactiveColor: theme.colorScheme.primary,
          activeColor: theme.colorScheme.primary,
          selectedColor: theme.colorScheme.primary,
          inactiveFillColor: appTheme.gray10002,
          activeFillColor: appTheme.gray10002,
          selectedFillColor: appTheme.gray10002,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
