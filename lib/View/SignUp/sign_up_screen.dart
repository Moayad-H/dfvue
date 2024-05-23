// import 'models/sign_up_model.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/utils/validation_functions.dart';
import 'package:dfvue/widgets/custom_icon_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.only(left: 9.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 87.v),
                                  Text("msg_create_your_account",
                                      style: theme.textTheme.headlineSmall),
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
                                                    padding: EdgeInsets.only(
                                                        right: 89.h,
                                                        bottom: 234.v),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                              height: 41.v,
                                                              width: 46.h,
                                                              decoration: BoxDecoration(
                                                                  color: appTheme
                                                                      .blueGray100,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(23
                                                                              .h),
                                                                  border: Border.all(
                                                                      color: appTheme
                                                                          .gray50001
                                                                          .withOpacity(
                                                                              0.7),
                                                                      width: 1
                                                                          .h))),
                                                          Container(
                                                              height: 41.v,
                                                              width: 46.h,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 19
                                                                          .h),
                                                              decoration: BoxDecoration(
                                                                  color: appTheme
                                                                      .blueGray100,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(23
                                                                              .h),
                                                                  border: Border.all(
                                                                      color: appTheme
                                                                          .gray50001
                                                                          .withOpacity(
                                                                              0.7),
                                                                      width: 1
                                                                          .h))),
                                                          Container(
                                                              height: 41.v,
                                                              width: 46.h,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 19
                                                                          .h),
                                                              decoration: BoxDecoration(
                                                                  color: appTheme
                                                                      .blueGray100,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(23
                                                                              .h),
                                                                  border: Border.all(
                                                                      color: appTheme
                                                                          .gray50001
                                                                          .withOpacity(
                                                                              0.7),
                                                                      width:
                                                                          1.h)))
                                                        ]))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18.h,
                                                            vertical: 112.v),
                                                    decoration: AppDecoration
                                                        .fillGray
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .customBorderTL110),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 22
                                                                            .h,
                                                                        right: 12
                                                                            .h),
                                                                child:
                                                                    CustomTextFormField(
                                                                        controller:
                                                                            TextEditingController(),
                                                                        hintText:
                                                                            "lbl_enter_your_name",
                                                                        prefix: Container(
                                                                            margin: EdgeInsets.fromLTRB(
                                                                                16.h,
                                                                                18.v,
                                                                                13.h,
                                                                                17.v),
                                                                            child: CustomImageView(imagePath: ImageConstant.imgSignup3, height: 25.adaptSize, width: 25.adaptSize)),
                                                                        prefixConstraints: BoxConstraints(maxHeight: 60.v),
                                                                        validator: (value) {
                                                                          if (!isText(
                                                                              value)) {
                                                                            return "err_msg_please_enter_valid_text";
                                                                          }
                                                                          return null;
                                                                        })),
                                                          ),
                                                          SizedBox(
                                                              height: 33.v),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 22.h,
                                                                    right:
                                                                        12.h),
                                                            child:
                                                                CustomTextFormField(
                                                                    controller:
                                                                        TextEditingController(),
                                                                    hintText:
                                                                        "msg_enter_your_phone",
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
                                                                            imagePath: ImageConstant
                                                                                .imgFfddf1,
                                                                            height: 25
                                                                                .adaptSize,
                                                                            width: 25
                                                                                .adaptSize)),
                                                                    prefixConstraints:
                                                                        BoxConstraints(
                                                                            maxHeight: 60
                                                                                .v),
                                                                    validator:
                                                                        (value) {
                                                                      if (!isValidPhone(
                                                                          value)) {
                                                                        return "err_msg_please_enter_valid_phone_number";
                                                                      }
                                                                      return null;
                                                                    }),
                                                          ),
                                                          SizedBox(
                                                              height: 33.v),
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 22.h,
                                                                  right: 12.h),
                                                              child:
                                                                  CustomTextFormField(
                                                                      controller:
                                                                          TextEditingController(),
                                                                      hintText:
                                                                          "msg_enter_your_password",
                                                                      textInputAction: TextInputAction
                                                                          .done,
                                                                      textInputType: TextInputType
                                                                          .visiblePassword,
                                                                      prefix: Container(
                                                                          margin: EdgeInsets.fromLTRB(
                                                                              16
                                                                                  .h,
                                                                              20
                                                                                  .v,
                                                                              13
                                                                                  .h,
                                                                              15
                                                                                  .v),
                                                                          child: CustomImageView(
                                                                              imagePath: ImageConstant
                                                                                  .imgHhuuhuh2,
                                                                              height: 25
                                                                                  .adaptSize,
                                                                              width: 25
                                                                                  .adaptSize)),
                                                                      prefixConstraints: BoxConstraints(
                                                                          maxHeight: 60
                                                                              .v),
                                                                      suffix: InkWell(
                                                                          onTap: () {},
                                                                          child: Container(margin: EdgeInsets.fromLTRB(12.h, 20.v, 20.h, 15.v), child: CustomImageView(imagePath: ImageConstant.imgHide1, height: 25.adaptSize, width: 25.adaptSize))),
                                                                      suffixConstraints: BoxConstraints(maxHeight: 60.v),
                                                                      validator: (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            (!isValidPassword(value,
                                                                                isRequired: true))) {
                                                                          return "err_msg_please_enter_valid_password";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      contentPadding: EdgeInsets.symmetric(vertical: 20.v))),
                                                          SizedBox(height: 4.v),
                                                          _buildSignUpWith(
                                                              context),
                                                          SizedBox(
                                                              height: 17.v),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          100.h,
                                                                      right:
                                                                          88.h),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgFacebook1,
                                                                        height: 25
                                                                            .adaptSize,
                                                                        width: 25
                                                                            .adaptSize),
                                                                    Spacer(
                                                                        flex:
                                                                            50),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgGoogle1,
                                                                        height: 25
                                                                            .adaptSize,
                                                                        width: 25
                                                                            .adaptSize),
                                                                    Spacer(
                                                                        flex:
                                                                            49),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgApple1,
                                                                        height: 25
                                                                            .adaptSize,
                                                                        width: 25
                                                                            .adaptSize)
                                                                  ])),
                                                          SizedBox(
                                                              height: 27.v),
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right: 43
                                                                              .h),
                                                                  child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                            "msg_already_have_an",
                                                                            style:
                                                                                CustomTextStyles.bodyMediumOnErrorContainer),
                                                                        GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              onTapTxtLogin(context);
                                                                            },
                                                                            child:
                                                                                Text("lbl_login", style: CustomTextStyles.bodyMediumPrimary))
                                                                      ]))),
                                                          SizedBox(height: 83.v)
                                                        ])))
                                          ]))
                                ])))))));
  }

  /// Section Widget
  Widget _buildSignUpWith(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 148.v,
            width: 324.h,
            child: Stack(alignment: Alignment.bottomLeft, children: [
              CustomIconButton(
                  height: 52.v,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 312.h,
                  alignment: Alignment.centerLeft,
                  onTap: () {
                    onTapBtnIconButton(context);
                  },
                  child: CustomImageView()),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 110.h),
                      child: Text("lbl_sign_up_with",
                          style:
                              CustomTextStyles.bodyMediumErrorContainer15_1))),
              CustomImageView(
                  imagePath: ImageConstant.imgCdddf2,
                  height: 142.v,
                  width: 200.h,
                  alignment: Alignment.topRight),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 123.h),
                      child: Text("lbl_sign_up",
                          style: theme.textTheme.titleSmall)))
            ])));
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
