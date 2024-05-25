import 'package:dfvue/Providers/SignUpProvider.dart';
import 'package:dfvue/Providers/logInProvider.dart';
import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/utils/validation_functions.dart';
import 'package:dfvue/widgets/custom_elevated_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        body: Consumer<LogInProvider>(
          builder: (context, provider, child) => Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 40.v),
                      Text(
                        "lbl_welcome_back".tr(context),
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 795.v,
                        width: 383.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 84.h,
                                  bottom: 234.v,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 41.v,
                                      width: 46.h,
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius:
                                            BorderRadius.circular(23.h),
                                        border: Border.all(
                                          color: appTheme.gray50001
                                              .withOpacity(0.7),
                                          width: 1.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 41.v,
                                      width: 46.h,
                                      margin: EdgeInsets.only(left: 19.h),
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius:
                                            BorderRadius.circular(23.h),
                                        border: Border.all(
                                          color: appTheme.gray50001
                                              .withOpacity(0.7),
                                          width: 1.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 41.v,
                                      width: 46.h,
                                      margin: EdgeInsets.only(left: 19.h),
                                      decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius:
                                            BorderRadius.circular(23.h),
                                        border: Border.all(
                                          color: appTheme.gray50001
                                              .withOpacity(0.7),
                                          width: 1.h,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.h,
                                  vertical: 112.v,
                                ),
                                decoration:
                                    AppDecoration.fillGray20001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL110,
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
                                        hintText:
                                            "lbl_email_address".tr(context),
                                        textInputType:
                                            TextInputType.emailAddress,
                                        prefix: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 17.v),
                                            child: Icon(Icons.email)),
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
                                        hintText:
                                            "lbl_enter_password".tr(context),
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        obscureText: provider.isObscure,
                                        prefix: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 17.v),
                                            child: Icon(Icons.password)),
                                        suffix: InkWell(
                                          onTap: provider.changeObscure,
                                          child: provider.isObscure
                                              ? Icon(Icons.visibility_sharp)
                                              : Icon(Icons.visibility_off),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter a valid password";
                                          }
                                          return null;
                                        },
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.v),
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
                                            style: CustomTextStyles
                                                .bodyMediumErrorContainer,
                                          ),
                                        ),
                                      ),
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
                                                imagePath:
                                                    ImageConstant.imgFacebook1,
                                                height: 25.adaptSize,
                                                width: 25.adaptSize,
                                              ),
                                              Spacer(flex: 45),
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgGoogle1,
                                                height: 25.adaptSize,
                                                width: 25.adaptSize,
                                              ),
                                              Spacer(flex: 54),
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgApple1,
                                                height: 25.adaptSize,
                                                width: 25.adaptSize,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 26.v),
                                        Padding(
                                          padding: EdgeInsets.all(1),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 1.v),
                                                child: Text(
                                                  "msg_already_have_an"
                                                      .tr(context),
                                                  style: CustomTextStyles
                                                      .bodyMediumOnErrorContainer,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  onTapTxtSignUp(context);
                                                },
                                                child: Text(
                                                  "lbl_sign_up".tr(context),
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
          await ProfileProvider().loadUserProfile();
          GoRouter.of(context).go(AppRoutes.authPage);
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
    GoRouter.of(context).push(
      AppRoutes.signUpScreen,
    );
  }
}
