import 'dart:developer';

import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TranscriptionScreen extends StatelessWidget {
  const TranscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Consumer<VoiceRecognitionProvider>(
        builder: (context, voiceProvider, child) => SafeArea(
            child: Scaffold(
                body: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      _buildOne(context),
                      SizedBox(height: 40.v),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 14.h, right: 25.h),
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 46.v);
                              },
                              itemCount: voiceProvider.textList.length,
                              itemBuilder: (context, index) {
                                final transcription =
                                    voiceProvider.textList[index];

                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.h,
                                    vertical: 16.v,
                                  ),
                                  decoration: AppDecoration
                                      .outlineErrorContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10,
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      transcription.text,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Container(
                                      decoration:
                                          AppDecoration.outlinePrimary.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder30,
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete_outline_outlined,
                                          color: theme.primaryColor,
                                        ),
                                        onPressed: () async {
                                          await voiceProvider
                                              .deleteTranscription(index);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(voiceProvider
                                                    .saveStatusMessage)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                      ),
                      SizedBox(height: 20.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgClose,
                          height: 24.v,
                          width: 30.h,
                          onTap: () {
                            GoRouter.of(context).pop();
                          }),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 83.h, vertical: 9.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.customBorderBR110),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 44.v),
              Text("Conversations", style: theme.textTheme.headlineLarge)
            ]));
  }
}
