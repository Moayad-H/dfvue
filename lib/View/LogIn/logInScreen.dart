import 'package:dfvue/Providers/logInProvider.dart';

import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';

import 'package:dfvue/widgets/custom_elevated_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryFixed,
      resizeToAvoidBottomInset: false,
      body: Consumer<LogInProvider>(
        builder: (context, provider, child) => Form(
          key: _formKey,
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 80.v),
                      Text(
                        "lbl_welcome_back".tr(context),
                        style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 34,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                      SizedBox(height: 80.v),
                      SizedBox(
                        height: 855.v,
                        width: 383.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.h,
                            vertical: 135.v,
                          ),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL110,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.h,
                                  right: 5.h,
                                ),
                                child: CustomTextFormField(
                                  autofocus: false,
                                  controller: provider.emailController,
                                  hintText: "lbl_email_address".tr(context),
                                  hintStyle: const TextStyle(
                                      fontSize: 16, letterSpacing: 1),
                                  textInputType: TextInputType.emailAddress,
                                  prefix: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 17.v),
                                      child: const Icon(Icons.email)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 40.v),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.h,
                                  right: 5.h,
                                ),
                                child: CustomTextFormField(
                                  autofocus: false,
                                  controller: provider.passwordController,
                                  hintText: "lbl_enter_password".tr(context),
                                  hintStyle: const TextStyle(
                                      fontSize: 16, letterSpacing: 1),
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  obscureText: provider.isObscure,
                                  prefix: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 17.v),
                                      child: const Icon(Icons.password)),
                                  suffix: InkWell(
                                    onTap: provider.changeObscure,
                                    child: provider.isObscure
                                        ? const Icon(Icons.visibility_sharp)
                                        : const Icon(Icons.visibility_off),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a valid password";
                                    }
                                    return null;
                                  },
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.v),
                                ),
                              ),
                              SizedBox(height: 17.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgetPassword(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 29.h),
                                    child: Text(
                                      "Forgot Password",
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(
                                              color: theme.colorScheme.primary),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _buildLogIn(context, provider),
                                  SizedBox(height: 15.v),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 80.h,
                                      right: 80.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgFacebook1,
                                          height: 25.adaptSize,
                                          width: 25.adaptSize,
                                        ),
                                        const Spacer(flex: 45),
                                        CustomImageView(
                                          imagePath: ImageConstant.imgGoogle1,
                                          height: 25.adaptSize,
                                          width: 25.adaptSize,
                                        ),
                                        const Spacer(flex: 54),
                                        CustomImageView(
                                          imagePath: ImageConstant.imgApple1,
                                          height: 25.adaptSize,
                                          width: 25.adaptSize,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 26.v),
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text(
                                            "msg_already_have_an".tr(context),
                                            style: CustomTextStyles
                                                .bodyMediumOnErrorContainer,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            onTapTxtSignUp(context);
                                          },
                                          child: Text(
                                            " ${"lbl_sign_up".tr(context)}",
                                            style: CustomTextStyles
                                                .bodyMediumPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLogIn(BuildContext context, LogInProvider provider) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomElevatedButton(
        height: 53.v,
        width: 318.h,
        text: "lbl_login".tr(context),
        buttonStyle: CustomButtonStyles.outlineErrorContainerTL10,
        alignment: Alignment.center,
        // onPressed: onTapImgCdddfOne(context),
        onPressed: () async {
          await provider.logIn(context);
          if (context.mounted) {
            GoRouter.of(context).go(AppRoutes.authPage);
          }
        },
      ),
    ]);
  }

  /// Navigates to the resetPasswordScreen when the action is triggered.
  onTapTxtForgetPassword(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.resetPasswordScreen,
    );
  }

  /// Navigates to the startScreen when the action is triggered.
  onTapImgCdddfOne(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.languageScreen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    GoRouter.of(context).pushReplacement(
      AppRoutes.signUpScreen,
    );
  }
}
