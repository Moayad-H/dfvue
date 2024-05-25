import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:dfvue/Providers/SignUpProvider.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:dfvue/utils/validation_functions.dart';
import 'package:dfvue/widgets/custom_icon_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:dfvue/app_export.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        body: Consumer<SignupProvider>(
          builder: (context, profileProvider, child) => Form(
            key: profileProvider.formKey,
            child: profileProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 9.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 87.v),
                        Text(
                          "Create Your Account",
                          style: theme.textTheme.headlineSmall,
                        ),
                        SizedBox(height: 91.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.h, vertical: 112.v),
                          decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL110,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                controller: profileProvider.nameController,
                                hintText: "Enter Your name",
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                                prefix: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 17.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSignup3,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 33.v),
                              CustomTextFormField(
                                controller: profileProvider.emailController,
                                hintText: "Enter your Email Address",
                                textInputType: TextInputType.emailAddress,
                                prefix: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 17.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgFfddf1,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 33.v),
                              CustomTextFormField(
                                controller: profileProvider.passwordController,
                                hintText: "Enter your password",
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 17.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgHhuuhuh2,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                  ),
                                ),
                                suffix: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 17.v),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgHide1,
                                      height: 25.adaptSize,
                                      width: 25.adaptSize,
                                    ),
                                  ),
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
                              SizedBox(height: 10.v),
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(10.h),
                                  border: Border.all(
                                      color: theme.primaryColor, width: 1.h),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: theme.textTheme.titleSmall,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        profileProvider.signUp(context);
                                      },
                                      icon: CustomImageView(
                                        imagePath: ImageConstant.imgCdddf2,
                                        height: 40.v,
                                        width: 100.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 17.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgFacebook1,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGoogle1,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgApple1,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                  ),
                                ],
                              ),
                              SizedBox(height: 27.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: CustomTextStyles
                                        .bodyMediumOnErrorContainer,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .push(AppRoutes.logInScreen);
                                    },
                                    child: Text(
                                      "Login",
                                      style: CustomTextStyles.bodyMediumPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 83.v),
                            ],
                          ),
                        ),
                        SizedBox(height: 87.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 23.h,
                              backgroundColor: appTheme.blueGray100,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: appTheme.gray50001.withOpacity(0.7),
                                    width: 1.h,
                                  ),
                                  borderRadius: BorderRadius.circular(23.h),
                                ),
                              ),
                            ),
                            SizedBox(width: 19.h),
                            CircleAvatar(
                              radius: 23.h,
                              backgroundColor: appTheme.blueGray100,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: appTheme.gray50001.withOpacity(0.7),
                                    width: 1.h,
                                  ),
                                  borderRadius: BorderRadius.circular(23.h),
                                ),
                              ),
                            ),
                            SizedBox(width: 19.h),
                            CircleAvatar(
                              radius: 23.h,
                              backgroundColor: appTheme.blueGray100,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: appTheme.gray50001.withOpacity(0.7),
                                    width: 1.h,
                                  ),
                                  borderRadius: BorderRadius.circular(23.h),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the otpVerificationScreen when the action is triggered.
  void onTapBtnIconButton(BuildContext context) {
    GoRouter.of(context).push(AppRoutes.otpVerifcationScreen);
  }

  /// Navigates to the logInScreen when the action is triggered.
  void onTapTxtLogin(BuildContext context) {
    GoRouter.of(context).push(AppRoutes.logInScreen);
  }
}
