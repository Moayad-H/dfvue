import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/routes/app_routes.dart';
import 'package:dfvue/theme/app_decoration.dart';
import 'package:dfvue/theme/custom_button_style.dart';
import 'package:dfvue/theme/theme_helper.dart';
import 'package:dfvue/utils/image_constant.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:dfvue/utils/validation_functions.dart';
import 'package:dfvue/widgets/custom_elevated_button.dart';
import 'package:dfvue/widgets/custom_image_view.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Consumer<ProfileProvider>(
          builder: (context, provider, child) => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfile(context),
                SizedBox(height: 19.v),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_username".tr(context),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(height: 2.v),
                      CustomTextFormField(
                        autofocus: false,
                        controller: provider.nameController,
                        hintText: "lbl_username".tr(context),
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 11.v),
                      ),
                      SizedBox(height: 18.v),
                      Text(
                        "lbl_email_i_d".tr(context),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(height: 2.v),
                      CustomTextFormField(
                        autofocus: false,
                        controller: provider.emailController,
                        hintText: "lbl_email_i_d".tr(context),
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              !isValidEmail(value, isRequired: true)) {
                            return "Please Enter Valid Email";
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 11.v),
                      ),
                      SizedBox(height: 18.v),
                      SizedBox(height: 65.v),
                    ],
                  ),
                ),
                _buildUpdate(context, provider),
                SizedBox(height: 65.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTapTxtLogOut(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 6.h, top: 3.v),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.login,
                              color: Colors.red,
                            ),
                            Text(
                              "lbl_log_out".tr(context),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return Stack(children: [
      Container(
        height: 205.v,
        width: double.maxFinite,
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.customBorderBR110,
        ),
      ),
      Column(
        children: [
          Row(
            children: [
              IconButton(
                  iconSize: 30,
                  onPressed: GoRouter.of(context).pop,
                  icon: Icon(Icons.arrow_back)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "lbl_profile".tr(context),
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(height: 30.v),
          CustomImageView(
            imagePath: ImageConstant.imgUnsplashJmurdhtm7ng,
            height: 142.adaptSize,
            width: 142.adaptSize,
            radius: BorderRadius.circular(71.h),
          ),
          SizedBox(height: 10.v),
        ],
      ),
    ]);
  }

  Widget _buildUpdate(BuildContext context, ProfileProvider provider) {
    return CustomElevatedButton(
      onPressed: () => provider.updateProfile(context),
      height: 40.v,
      text: "lbl_update".tr(context),
      margin: EdgeInsets.only(left: 54.h, right: 53.h),
      buttonStyle: CustomButtonStyles.outlineErrorContainer,
    );
  }

  void onTapImgClose(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onTapTxtLogOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    GoRouter.of(context).go(AppRoutes.authPage);
  }
}
