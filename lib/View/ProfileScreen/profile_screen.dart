import 'package:dfvue/Providers/profileProvider.dart';
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                        const Text(
                          "Name",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        SizedBox(height: 2.v),
                        CustomTextFormField(
                          autofocus: false,
                          controller: provider.nameController,
                          hintText: "name",
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.h, vertical: 11.v),
                        ),
                        SizedBox(height: 18.v),
                        const Text(
                          "Email",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        SizedBox(height: 2.v),
                        CustomTextFormField(
                          autofocus: false,
                          controller: provider.emailController,
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 14),
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
                  _buildUpdate(context),
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
                          child: const Row(
                            children: [
                              Icon(
                                Icons.login,
                                color: Colors.red,
                              ),
                              Text(
                                "Log Out",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile",
                style: TextStyle(
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

  Widget _buildUpdate(BuildContext context) {
    return CustomElevatedButton(
      height: 40.v,
      text: "Update",
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
