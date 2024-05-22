import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/widgets/custom_drop_down.dart';
import 'package:dfvue/widgets/custom_outlined_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? selectedSpoken = "en"; // Default value for spoken language
  String selectedSubtitle = 'English'; // Default value for subtitle language

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildView(context),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h, bottom: 10.h),
              child: Text(
                "Select App Language",
                style: TextStyle(
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
                "What language should be used:",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            SizedBox(height: 13.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
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
                          hint: Text('Select Spoken Language'),
                          items: [
                            DropdownMenuItem(
                              value: 'en',
                              child: Text('English'),
                            ),
                            DropdownMenuItem(
                              value: 'ar',
                              child: Text('Arabic'),
                            ),
                          ],
                          onChanged: (newVal) {
                            setState(() {
                              selectedSpoken = newVal;
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
            SizedBox(height: 28.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
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
                              value: 'English',
                              child: Text('English'),
                            ),
                            DropdownMenuItem(
                              value: 'Arabic',
                              child: Text('Arabic'),
                            ),
                          ],
                          onChanged: (newVal) {
                            setState(() {
                              selectedSubtitle = newVal!;
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
              text: "Continue",
              buttonTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.startScreen);
              },
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildView(BuildContext context) {
    return Container(
      height: 350.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(110.h)),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 30,
                      onPressed: GoRouter.of(context).pop,
                      icon: Icon(Icons.arrow_back)),
                  Container(
                    alignment: Alignment.center,
                    child: CustomImageView(
                      height: 200.h,
                      width: 300.v,
                      color: Colors.white,
                      imagePath: ImageConstant.imgDfVue61,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome User",
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
                    "Before you start, let's set up your language",
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
      ),
    );
  }
}
