import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/widgets/custom_elevated_button.dart';
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
                          "msg_create_your_account".tr(context),
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
                                hintText: "lbl_enter_your_name".tr(context),
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                                prefix: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 17.v),
                                    child: Icon(Icons.person)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 33.v),
                              CustomTextFormField(
                                autofocus: false,
                                controller: profileProvider.emailController,
                                hintText: "lbl_email_address".tr(context),
                                textInputType: TextInputType.emailAddress,
                                prefix: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 17.v),
                                    child: Icon(Icons.email)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 33.v),
                              CustomTextFormField(
                                autofocus: false,
                                controller: profileProvider.passwordController,
                                hintText: "lbl_enter_password".tr(context),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                obscureText: profileProvider.isObscure,
                                prefix: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 17.v),
                                    child: Icon(Icons.password)),
                                suffix: InkWell(
                                  onTap: profileProvider.changeObscure,
                                  child: profileProvider.isObscure
                                      ? Icon(Icons.visibility_sharp)
                                      : Icon(Icons.visibility_off),
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
                                    CustomElevatedButton(
                                      onPressed: () => profileProvider.signUp,
                                      height: 53.v,
                                      width: 318.h,
                                      text: "lbl_sign_up".tr(context),
                                      buttonStyle: CustomButtonStyles
                                          .outlineErrorContainerTL10,
                                      alignment: Alignment.center,
                                      // onPressed: onTapImgCdddfOne(context),
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
                                    "msg_already_have_an".tr(context),
                                    style: CustomTextStyles
                                        .bodyMediumOnErrorContainer,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .push(AppRoutes.logInScreen);
                                    },
                                    child: Text(
                                      "lbl_login".tr(context),
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
