import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Consumer2<ProfileProvider, VoiceRecognitionProvider>(
      builder: (context, value, voice, child) => Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: MediaQuery.of(context).size.width * 0.08,
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              onTapImgNnnjOne(context);
                            },
                            child: CustomImageView(
                              imagePath: ImageConstant.imgNnnj1,
                              height: 30.adaptSize,
                              width: 30.adaptSize,
                              alignment: Alignment.topRight,
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              value.loadUserProfile();
                              GoRouter.of(context).push(
                                AppRoutes.userProfileScreen,
                              );
                            },
                            child: CustomImageView(
                              imagePath: ImageConstant.imgPp4,
                              height: 30.v,
                              width: 33.h,
                              radius: BorderRadius.circular(15.h),
                              alignment: Alignment.topRight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.v),
                CustomImageView(
                  imagePath: ImageConstant.imgDfVue61,
                  height: mediaQueryData.size.height * 0.50,
                  width: mediaQueryData.size.width,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.wifiPage);
                    },
                    child: Container(
                      width: mediaQueryData.size.width,
                      height: mediaQueryData.size.height * 0.125,
                      padding: const EdgeInsets.all(8),
                      decoration: AppDecoration.outlineWhiteA,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "lbl_ar_subtitles".tr(context),
                            style: CustomTextStyles.titleLargeInterWhiteA700,
                          ),
                          SizedBox(height: 5.v),
                          Text(
                            "msg_requires_supported".tr(context),
                            style: CustomTextStyles.bodySmallOutfitWhiteA700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: GestureDetector(
                    onTap: () {
                      onTapThirtyNine(context, voice);
                    },
                    child: Container(
                      width: mediaQueryData.size.width,
                      height: mediaQueryData.size.height * 0.125,
                      padding: const EdgeInsets.all(8),
                      decoration: AppDecoration.outlineWhiteA,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "lbl_subtitles".tr(context),
                            style: CustomTextStyles.titleLargeInterWhiteA700,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.v),
                          Text(
                            "msg_run_on_your_phone".tr(context),
                            style: CustomTextStyles.bodySmallOutfitWhiteA700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapThirtyNine(
      BuildContext context, VoiceRecognitionProvider provider) {
    GoRouter.of(context).push(AppRoutes.voiceRecognitionScreen);
  }

  void onTapImgNnnjOne(BuildContext context) {
    GoRouter.of(context).push(AppRoutes.transcriptionScreen);
  }
}
