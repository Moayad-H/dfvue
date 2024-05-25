import 'dart:developer';
import 'package:dfvue/localization/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/widgets/custom_outlined_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      top: false,
      child: Scaffold(
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
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  buildBackgroundElements(context),
                  CustomImageView(
                    imagePath: ImageConstant.img1000F20937617,
                    height: 600,
                    width: 390,
                    alignment: Alignment.center,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomOutlinedButton(
                    height: 63,
                    width: 212,
                    text: "lbl_login".tr(context),
                    buttonStyle: CustomButtonStyles.outlineLime,
                    buttonTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
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
                      buttonTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                      onPressed: () {
                        log('Navigated to Sign Up Screen');
                        GoRouter.of(context).push(AppRoutes.signUpScreen);
                        log('Navigated to Sign Up Screen');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBackgroundElements(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: double.maxFinite,
          child: Stack(
            // alignment: Alignment.topCenter,
            children: [_buildTopCenterLogo(context)],
          ),
        ),
      ],
    );
  }

  Widget _buildTopCenterLogo(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 260,
                width: 260,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .errorContainer
                          .withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.2),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),

                // Text(
                //   "DfVue", // Your text here
                //   style: TextStyle(
                //     color: Colors.amber,
                //     fontSize: 24, // Adjust font size as needed
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
              Stack(alignment: Alignment.center, children: [
                Container(
                  height: 400,
                  width: 400,
                  child: Image.asset(
                    ImageConstant.imgCdddf2520x390,
                  ),
                ),
                Positioned(
                  child: Text(
                    "DfVue", // Your text here
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ]));
  }
}
