import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/widgets/custom_drop_down.dart';
import 'package:dfvue/widgets/custom_outlined_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  String? selectedSpoken = "en"; // Default value for spoken language
  String? selectedSubtitle = 'en'; // Default value for subtitle language

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Consumer<ProfileProvider>(
      builder: (BuildContext context, ProfileProvider value, Widget? child) =>
          Consumer<AppProvider>(builder: (context, language, child) {
        selectedSubtitle = language.locale!.languageCode;
        selectedSpoken = language.spokenLocale!.languageCode;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildView(context, value),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 10.h, bottom: 10.h),
                child: Text(
                  "msg_select_app_language".tr(context),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: EdgeInsets.only(left: 18.h),
                child: Text(
                  "msg_what_language_the".tr(context),
                  style: TextStyle(
                      fontSize: 15, color: theme.colorScheme.onPrimary),
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('msg_subtitle_language'.tr(context),
                    style: TextStyle(
                        fontSize: 20, color: theme.colorScheme.onPrimary)),
              ),
              SizedBox(height: 5.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(
                            color: theme.colorScheme.primary, width: 1.h),
                      ),
                      child: Row(
                        children: [
                          DropdownButton<String>(
                            value: selectedSpoken,
                            hint: Text('msg_subtitle_language'.tr(context)),
                            items: [
                              DropdownMenuItem(
                                value: 'en',
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: 'ar',
                                child: Text('العربية'),
                              ),
                            ],
                            onChanged: (newVal) {
                              setState(() {
                                language.setSpokenLocale(Locale(newVal!));
                              });
                            },
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("msg_select_app_language".tr(context),
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              SizedBox(height: 5.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(
                            color: theme.colorScheme.primary, width: 1.h),
                      ),
                      child: Row(
                        children: [
                          DropdownButton<String>(
                            value: selectedSubtitle,
                            hint: Text('Select Subtitle Language'),
                            items: [
                              DropdownMenuItem(
                                value: 'en',
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: 'ar',
                                child: Text('العربية'),
                              ),
                            ],
                            onChanged: (newVal) {
                              setState(() {
                                language.setLocale(Locale(newVal!));
                              });
                            },
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomOutlinedButton(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(10.h),
                  border: Border.all(color: theme.primaryColor, width: 1.h),
                ),
                width: 200.h,
                text: "lbl_continue".tr(context),
                buttonTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.startScreen);
                },
                alignment: Alignment.center,
              ),
            ],
          ),
        );
      }),
    );
  }

  /// Section Widget
  Widget _buildView(BuildContext context, ProfileProvider provider) {
    return Container(
      height: 350.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(110.h)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       IconButton(
          //           iconSize: 30,
          //           onPressed: GoRouter.of(context).pop,
          //           icon: Icon(Icons.arrow_back)),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CustomImageView(
                    height: 100.h,
                    width: 300.v,
                    color: Colors.white,
                    imagePath: ImageConstant.imgDfVue61,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${"lbl_welcome_user".tr(context)} ${provider.userProfile?.name}" ??
                      '',
                  style: CustomTextStyles.titleLargeGray200e5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  "msg_before_you_start2".tr(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleLargeGray200e5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
