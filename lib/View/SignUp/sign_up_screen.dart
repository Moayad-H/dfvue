// import 'models/sign_up_model.dart';
import 'package:dfvue/Providers/SignUpProvider.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/utils/validation_functions.dart';
import 'package:dfvue/widgets/custom_icon_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore_for_file: must_be_immutable
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
                      : SizedBox(
                          width: double.maxFinite,
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 9.h),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 87.v),
                                        Text("Create Your Account",
                                            style:
                                                theme.textTheme.headlineSmall),
                                        SizedBox(height: 91.v),
                                        SizedBox(
                                            height: 795.v,
                                            width: 388.h,
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 89.h,
                                                                  bottom:
                                                                      234.v),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        41.v,
                                                                    width: 46.h,
                                                                    decoration: BoxDecoration(
                                                                        color: appTheme
                                                                            .blueGray100,
                                                                        borderRadius:
                                                                            BorderRadius.circular(23
                                                                                .h),
                                                                        border: Border.all(
                                                                            color:
                                                                                appTheme.gray50001.withOpacity(0.7),
                                                                            width: 1.h))),
                                                                Container(
                                                                    height:
                                                                        41.v,
                                                                    width: 46.h,
                                                                    margin: EdgeInsets.only(
                                                                        left: 19
                                                                            .h),
                                                                    decoration: BoxDecoration(
                                                                        color: appTheme
                                                                            .blueGray100,
                                                                        borderRadius:
                                                                            BorderRadius.circular(23
                                                                                .h),
                                                                        border: Border.all(
                                                                            color:
                                                                                appTheme.gray50001.withOpacity(0.7),
                                                                            width: 1.h))),
                                                                Container(
                                                                    height:
                                                                        41.v,
                                                                    width: 46.h,
                                                                    margin: EdgeInsets.only(
                                                                        left: 19
                                                                            .h),
                                                                    decoration: BoxDecoration(
                                                                        color: appTheme
                                                                            .blueGray100,
                                                                        borderRadius:
                                                                            BorderRadius.circular(23
                                                                                .h),
                                                                        border: Border.all(
                                                                            color:
                                                                                appTheme.gray50001.withOpacity(0.7),
                                                                            width: 1.h)))
                                                              ]))),
                                                  Align(
                                                      alignment: Alignment
                                                          .center,
                                                      child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      18.h,
                                                                  vertical:
                                                                      112.v),
                                                          decoration: AppDecoration
                                                              .fillGray
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .customBorderTL110),
                                                          child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 22
                                                                            .h,
                                                                        right: 12
                                                                            .h),
                                                                    child:
                                                                        CustomTextFormField(
                                                                      autofocus:
                                                                          false,
                                                                      controller:
                                                                          profileProvider
                                                                              .nameController,
                                                                      hintText:
                                                                          "Enter Your name",
                                                                      textStyle: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              12),
                                                                      prefix: Container(
                                                                          margin: EdgeInsets.fromLTRB(
                                                                              16.h,
                                                                              18.v,
                                                                              13.h,
                                                                              17.v),
                                                                          child: CustomImageView(imagePath: ImageConstant.imgSignup3, height: 25.adaptSize, width: 25.adaptSize)),
                                                                      prefixConstraints:
                                                                          BoxConstraints(
                                                                              maxHeight: 60.v),
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter your name';
                                                                        }
                                                                        return null;
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        33.v),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          22.h,
                                                                      right:
                                                                          12.h),
                                                                  child:
                                                                      CustomTextFormField(
                                                                    autofocus:
                                                                        false,
                                                                    controller:
                                                                        profileProvider
                                                                            .emailController,
                                                                    hintText:
                                                                        "Enter your Email Address",
                                                                    textInputType:
                                                                        TextInputType
                                                                            .phone,
                                                                    prefix: Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            16
                                                                                .h,
                                                                            16
                                                                                .v,
                                                                            9.h,
                                                                            19
                                                                                .v),
                                                                        child: CustomImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgFfddf1,
                                                                            height: 25.adaptSize,
                                                                            width: 25.adaptSize)),
                                                                    prefixConstraints:
                                                                        BoxConstraints(
                                                                            maxHeight:
                                                                                60.v),
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter your email';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        33.v),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 22
                                                                            .h,
                                                                        right: 12
                                                                            .h),
                                                                    child: CustomTextFormField(
                                                                        autofocus: false,
                                                                        controller: profileProvider.passwordController,
                                                                        hintText: "Enter your password",
                                                                        textInputAction: TextInputAction.done,
                                                                        textInputType: TextInputType.visiblePassword,
                                                                        prefix: Container(margin: EdgeInsets.fromLTRB(16.h, 20.v, 13.h, 15.v), child: CustomImageView(imagePath: ImageConstant.imgHhuuhuh2, height: 25.adaptSize, width: 25.adaptSize)),
                                                                        prefixConstraints: BoxConstraints(maxHeight: 60.v),
                                                                        suffix: InkWell(onTap: () {}, child: Container(margin: EdgeInsets.fromLTRB(12.h, 20.v, 20.h, 15.v), child: CustomImageView(imagePath: ImageConstant.imgHide1, height: 25.adaptSize, width: 25.adaptSize))),
                                                                        suffixConstraints: BoxConstraints(maxHeight: 60.v),
                                                                        validator: (value) {
                                                                          if (value ==
                                                                              null) {
                                                                            return "err_msg_please_enter_valid_password";
                                                                          }
                                                                          return null;
                                                                        },
                                                                        contentPadding: EdgeInsets.symmetric(vertical: 20.v))),
                                                                SizedBox(
                                                                    height:
                                                                        10.v),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: theme
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.h),
                                                                    border: Border.all(
                                                                        color: theme
                                                                            .primaryColor,
                                                                        width: 1
                                                                            .h),
                                                                  ),
                                                                  child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                            "Sign Up",
                                                                            style:
                                                                                theme.textTheme.titleSmall),
                                                                        IconButton(
                                                                          // height: 52.v,
                                                                          // decoration: BoxDecoration(
                                                                          //   color: theme.primaryColor,
                                                                          //   borderRadius: BorderRadius.circular(10),
                                                                          // ),
                                                                          // width: 312.h,

                                                                          onPressed:
                                                                              () {
                                                                            profileProvider.signUp(context);
                                                                          },
                                                                          icon:
                                                                              CustomImageView(
                                                                            imagePath:
                                                                                ImageConstant.imgCdddf2,
                                                                            height:
                                                                                40.v,
                                                                            width:
                                                                                100.h,
                                                                            //alignment: Alignment.topRight
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        17.v),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 100
                                                                            .h,
                                                                        right: 88
                                                                            .h),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          CustomImageView(
                                                                              imagePath: ImageConstant.imgFacebook1,
                                                                              height: 25.adaptSize,
                                                                              width: 25.adaptSize),
                                                                          Spacer(
                                                                              flex: 50),
                                                                          CustomImageView(
                                                                              imagePath: ImageConstant.imgGoogle1,
                                                                              height: 25.adaptSize,
                                                                              width: 25.adaptSize),
                                                                          Spacer(
                                                                              flex: 49),
                                                                          CustomImageView(
                                                                              imagePath: ImageConstant.imgApple1,
                                                                              height: 25.adaptSize,
                                                                              width: 25.adaptSize)
                                                                        ])),
                                                                SizedBox(
                                                                    height:
                                                                        27.v),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Padding(
                                                                        padding: EdgeInsets.only(right: 43.h),
                                                                        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                          Text(
                                                                              "msg_already_have_an",
                                                                              style: CustomTextStyles.bodyMediumOnErrorContainer),
                                                                          GestureDetector(
                                                                              onTap: () {
                                                                                GoRouter.of(context).push(AppRoutes.logInScreen);
                                                                              },
                                                                              child: Text("lbl_login", style: CustomTextStyles.bodyMediumPrimary))
                                                                        ]))),
                                                                SizedBox(
                                                                    height:
                                                                        83.v)
                                                              ])))
                                                ]))
                                      ]))))),
            )));
  }

  /// Navigates to the otpVerifcationScreen when the action is triggered.
  onTapBtnIconButton(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.otpVerifcationScreen,
    );
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapTxtLogin(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.logInScreen,
    );
  }
}
