import 'dart:developer';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/theme/app_style.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/widgets/custom_outlined_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-0.26, 0.24),
            end: const Alignment(1.1, 0.5),
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.onPrimaryContainer,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img1000F20937617,
                    height: mediaQueryData.size.height,
                    width: 500,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image(
                        alignment: Alignment.center,
                        color: Colors.white,
                        fit: BoxFit.cover,
                        height: 500,
                        image: AssetImage(ImageConstant.dfVuelogoWithName)),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomOutlinedButton(
                          height: 63,
                          width: 212,
                          text: "lbl_login".tr(context),
                          buttonStyle: CustomButtonStyles.outlineLime,
                          buttonTextStyle: const TextStyle(
                              color: AppStyle.black, fontSize: 20),
                          onPressed: () {
                            GoRouter.of(context).push(AppRoutes.logInScreen);
                            log('Navigated to Log In Screen');
                          },
                        ),
                        const SizedBox(height: 32),
                        CustomOutlinedButton(
                            height: 63,
                            width: 212,
                            text: "lbl_sign_up".tr(context),
                            buttonStyle:
                                CustomButtonStyles.outlineErrorContainerTL101,
                            buttonTextStyle: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            onPressed: () {
                              log('Navigated to Sign Up Screen');
                              GoRouter.of(context).push(AppRoutes.signUpScreen);
                              log('Navigated to Sign Up Screen');
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
