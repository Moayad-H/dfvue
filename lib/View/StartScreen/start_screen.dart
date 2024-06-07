import 'package:dfvue/Providers/profileProvider.dart';
import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Consumer<ProfileProvider>(
      builder: (context, value, child) => SafeArea(
          child: Consumer<VoiceRecognitionProvider>(
        builder: (context, voice, child) => Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20.v),
                child: Column(children: [
                  SizedBox(
                      height: 500.v,
                      width: double.maxFinite,
                      child: Stack(alignment: Alignment.topRight, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgDfVue61,
                            height: 571.v,
                            width: 390.h,
                            alignment: Alignment.center),
                        Row(
                          children: [
                            IconButton(
                                alignment: Alignment.topLeft,
                                iconSize: 30,
                                onPressed: GoRouter.of(context).pop,
                                icon: Icon(Icons.arrow_back)),
                          ],
                        ),
                        CustomImageView(
                            imagePath: ImageConstant.imgNnnj1,
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 66.h),
                            onTap: () {
                              onTapImgNnnjOne(context);
                            }),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 25.v,
                            width: 28.h,
                            margin: EdgeInsets.only(top: 2.v, right: 16.h),
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(14.h)),
                          ),
                        ),
                        CustomImageView(
                            imagePath: ImageConstant.imgPp4,
                            height: 30.v,
                            width: 33.h,
                            radius: BorderRadius.circular(15.h),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 11.h),
                            onTap: () {
                              value.loadUserProfile();
                              GoRouter.of(context).push(
                                AppRoutes.userProfileScreen,
                              );
                            })
                      ])),
                  //   _buildThirtyNine(context)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.h,
                          vertical: 23.v,
                        ),
                        decoration: AppDecoration.outlineWhiteA,
                        child: Column(
                          children: [
                            Text(
                              "lbl_ar_subtitles".tr(context),
                              style: CustomTextStyles.titleLargeInterWhiteA700,
                            ),
                            SizedBox(height: 5.v),
                            Text(
                              "msg_requires_supported".tr(context),
                              style: CustomTextStyles.bodySmallOutfitWhiteA700,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      onTapThirtyNine(context, voice);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 64.h,
                          vertical: 23.v,
                        ),
                        decoration: AppDecoration.outlineWhiteA,
                        child: Column(
                          children: [
                            Text(
                              "lbl_subtitles".tr(context),
                              style: CustomTextStyles.titleLargeInterWhiteA700,
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
                  )
                ]))),
      )),
    );
  }

  /// Section Widget
  // Widget _buildThirtyNine(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 17.h, right: 20.h),
  //       child:  ListView.separated(
  //                 physics: NeverScrollableScrollPhysics(),
  //                 shrinkWrap: true,
  //                 separatorBuilder: (context, index) {
  //                   return SizedBox(height: 35.v);
  //                 },
  //                 itemCount: startModelObj?.thirtynineItemList.length ?? 0,
  //                 itemBuilder: (context, index) {
  //                   ThirtynineItemModel model =
  //                       startModelObj?.thirtynineItemList[index] ??
  //                           ThirtynineItemModel();
  //                   return ThirtynineItemWidget(model, onTapThirtyNine: () {
  //                     onTapThirtyNine(context);
  //                   });
  //                 });
  //           });
  // }

  /// Navigates to the voiceRecognitionScreen when the action is triggered.
  onTapThirtyNine(BuildContext context, VoiceRecognitionProvider provider) {
    GoRouter.of(context).push(AppRoutes.voiceRecognitionScreen);
  }

  /// Navigates to the templatesScreen when the action is triggered.
  onTapImgNnnjOne(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.transcriptionScreen,
    );
  }
}
