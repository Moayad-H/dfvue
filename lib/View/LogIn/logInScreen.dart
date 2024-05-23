import 'package:dfvue/Providers/SignUpProvider.dart';
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
        body: Consumer<SignupProvider>(
          builder: (context, provider, child) => Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 99.v),
                      Text(
                        "Welcome Back",
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 79.v),
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
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 20.h,
                                          right: 5.h,
                                        ),
                                        child: CustomTextFormField(
                                          autofocus: false,
                                          controller: provider.nameController,
                                          hintText: "Enter Your User Name",
                                          alignment: Alignment.center,
                                          prefix: Container(
                                            margin: EdgeInsets.fromLTRB(
                                              17.h,
                                              18.v,
                                              12.h,
                                              17.v,
                                            ),
                                            child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgSignup3,
                                              height: 25.adaptSize,
                                              width: 25.adaptSize,
                                            ),
                                          ),
                                          prefixConstraints:
                                              BoxConstraints(maxHeight: 60.v),
                                          validator: (value) {
                                            if (!isText(value)) {
                                              return "Please Enter Valid Text";
                                            }
                                            return null;
                                          },
                                        ),
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
                                        hintText: "Enter Your Password",
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        alignment: Alignment.center,
                                        prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                            17.h,
                                            18.v,
                                            12.h,
                                            17.v,
                                          ),
                                          child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgHhuuhuh2,
                                            height: 25.adaptSize,
                                            width: 25.adaptSize,
                                          ),
                                        ),
                                        prefixConstraints:
                                            BoxConstraints(maxHeight: 60.v),
                                        suffix: InkWell(
                                          onTap: () async {},
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                              12.h,
                                              18.v,
                                              16.h,
                                              17.v,
                                            ),
                                            child: CustomImageView(
                                              imagePath: ImageConstant.imgHide1,
                                              height: 25.adaptSize,
                                              width: 25.adaptSize,
                                            ),
                                          ),
                                        ),
                                        suffixConstraints:
                                            BoxConstraints(maxHeight: 60.v),
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidPassword(value,
                                                  isRequired: true))) {
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
                                    SizedBox(height: 50.v),
                                    _buildLogIn(context),
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
                                            imagePath: ImageConstant.imgGoogle1,
                                            height: 25.adaptSize,
                                            width: 25.adaptSize,
                                          ),
                                          Spacer(flex: 54),
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
                                      padding: EdgeInsets.all(1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 1.v),
                                            child: Text(
                                              "Don't have an account",
                                              style: CustomTextStyles
                                                  .bodyMediumOnErrorContainer,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              onTapTxtSignUp(context);
                                            },
                                            child: Text(
                                              "Sign Up",
                                              style: CustomTextStyles
                                                  .bodyMediumPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 83.v),
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
  Widget _buildLogIn(BuildContext context) {
    return SizedBox(
      height: 151.v,
      width: 323.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomElevatedButton(
            height: 53.v,
            width: 318.h,
            text: "lbl_log_in2",
            buttonStyle: CustomButtonStyles.outlineErrorContainerTL10,
            alignment: Alignment.center,
            // onPressed: onTapImgCdddfOne(context),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 116.h),
              child: Text(
                "lbl_sign_in_with",
                style: CustomTextStyles.bodyMediumErrorContainer15_1,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgCdddf2,
            height: 142.v,
            width: 200.h,
            alignment: Alignment.topRight,
            onTap: () {
              onTapImgCdddfOne(context);
            },
          ),
        ],
      ),
    );
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
