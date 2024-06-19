import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/View/VoiceRecognition/settingsSheet.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class VoiceRecognitionScreen extends StatefulWidget {
  const VoiceRecognitionScreen({super.key});

  @override
  State<VoiceRecognitionScreen> createState() => _VoiceRecognitionScreenState();
}

class _VoiceRecognitionScreenState extends State<VoiceRecognitionScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Consumer<VoiceRecognitionProvider>(
      builder: (context, provider, child) {
        return Consumer<AppProvider>(
          builder: (context, language, child) {
            String? currentText = '';
            return Scaffold(
              body: SafeArea(
                child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: GoRouter.of(context).pop,
                          icon: const Icon(Icons.arrow_back)),
                      SizedBox(height: 83.v),
                      Row(children: [
                        Container(
                            height: 100.v,
                            width: 8.h,
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(4.h))),
                        const SizedBox(width: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            reverse: true,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                textAlign: provider.textAlignIndx == 0
                                    ? TextAlign.left
                                    : provider.textAlignIndx == 1
                                        ? TextAlign.center
                                        : TextAlign.right,
                                provider.currentText!.isEmpty
                                    ? "lbl_speaking".tr(context)
                                    : provider.currentText!,
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleLarge!.copyWith(
                                  fontSize: provider.textSize,
                                  fontWeight: provider.fontWeight == 300
                                      ? FontWeight.w300
                                      : provider.fontWeight == 600
                                          ? FontWeight.w600
                                          : FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                      const Spacer(),
                      SizedBox(height: 28.v),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: provider.isListening
                                        ? Text(
                                            "Listening...",
                                            style: TextStyle(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : null,
                                  ),
                                  // AnimatedSwitcher(
                                  //   duration: const Duration(milliseconds: 200),
                                  //   child: provider.isListening
                                  //       ? AudioWaveforms(
                                  //           size: Size(
                                  //               MediaQuery.of(context)
                                  //                       .size
                                  //                       .width /
                                  //                   2,
                                  //               50),
                                  //           recorderController:
                                  //               provider.controller,
                                  //           waveStyle: const WaveStyle(
                                  //             waveColor: Colors.white,
                                  //             extendWaveform: true,
                                  //             showMiddleLine: false,
                                  //           ),
                                  //           decoration: BoxDecoration(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(12.0),
                                  //             color: const Color(0xFF1E1B26),
                                  //           ),
                                  //           padding:
                                  //               const EdgeInsets.only(left: 18),
                                  //           margin: const EdgeInsets.symmetric(
                                  //               horizontal: 15),
                                  //         )
                                  //       : null,
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 51.v,
                                    width: 62.h,
                                    decoration: BoxDecoration(
                                        color: provider.isListening
                                            ? theme.colorScheme.primary
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(40.h),
                                        boxShadow: [
                                          BoxShadow(
                                              color: theme.colorScheme.primary
                                                  .withOpacity(0.9),
                                              spreadRadius: 2.h,
                                              blurRadius: 2.h,
                                              offset: const Offset(0, 1))
                                        ]),
                                    child: AvatarGlow(
                                      animate: provider.isListening,
                                      glowColor: theme.colorScheme.primary,
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      repeat: true,
                                      startDelay:
                                          const Duration(milliseconds: 100),
                                      child: IconButton(
                                        icon: Image.asset(
                                          scale: 2.5,
                                          provider.speech.isListening
                                              ? ImageConstant.imgVoiceSearch32
                                              : ImageConstant.imgVoiceSearch4,
                                        ),
                                        onPressed: () async {
                                          provider.listen(language.spokenLocale,
                                              currentText);
                                          //provider.clearCurrentText(context);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        provider.clearCurrentText(context);
                                      },
                                      icon: const Icon(
                                          Icons.delete_outline_outlined),
                                      iconSize: 40,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const Settingssheet();
                                          },
                                          isDismissible: true,
                                        );
                                      },
                                      icon: const Icon(Icons.equalizer_rounded),
                                      iconSize: 40,
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        await provider.saveToFile();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                provider.saveStatusMessage),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.save_alt),
                                      iconSize: 40,
                                    ),
                                  ]),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// Navigates to the voiceRecognitiontwoContainerScreen when the action is triggered.
onTapImgVoiceSearchThirtyTwo(BuildContext context) {
  GoRouter.of(context).push(
    AppRoutes.voiceRecognitiontwoContainerScreen,
  );
}

/// Navigates to the startScreen when the action is triggered.
onTapView(BuildContext context) {
  GoRouter.of(context).push(
    AppRoutes.startScreen,
  );
}
