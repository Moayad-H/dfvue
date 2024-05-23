import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
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
                                    borderRadius:
                                        BorderRadius.circular(14.h)))),
                        CustomImageView(
                            imagePath: ImageConstant.imgPp4,
                            height: 30.v,
                            width: 33.h,
                            radius: BorderRadius.circular(15.h),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 11.h),
                            onTap: () {
                              onTapImgPp(context);
                            })
                      ])),
                  //   _buildThirtyNine(context)
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 63.h,
                        vertical: 23.v,
                      ),
                      decoration: AppDecoration.outlineWhiteA,
                      child: Column(
                        children: [
                          Text(
                            "AR Subtitels",
                            style: CustomTextStyles.titleLargeInterWhiteA700,
                          ),
                          SizedBox(height: 10.v),
                          Text(
                            'thirtynineItemModelObj.requirements!',
                            style: CustomTextStyles.bodySmallOutfitWhiteA700,
                          ),
                          SizedBox(height: 9.v),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  GestureDetector(
                    onTap: () {
                      onTapThirtyNine(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 63.h,
                        vertical: 23.v,
                      ),
                      decoration: AppDecoration.outlineWhiteA,
                      child: Column(
                        children: [
                          Text(
                            'Subtitles',
                            style: CustomTextStyles.titleLargeInterWhiteA700,
                          ),
                          SizedBox(height: 10.v),
                          Text(
                            'thirtynineItemModelObj.requirements!',
                            style: CustomTextStyles.bodySmallOutfitWhiteA700,
                          ),
                          SizedBox(height: 9.v),
                        ],
                      ),
                    ),
                  )
                ]))));
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
  onTapThirtyNine(BuildContext context) {
    GoRouter.of(context).push(AppRoutes.voiceRecognitionScreen);
  }

  /// Navigates to the templatesScreen when the action is triggered.
  onTapImgNnnjOne(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.transcriptionScreen,
    );
  }

  /// Navigates to the profileEditScreen when the action is triggered.
  onTapImgPp(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.profileEditScreen,
    );
  }
}
