import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeFontSheet extends StatefulWidget {
  const ChangeFontSheet({super.key});

  @override
  State<ChangeFontSheet> createState() => _ChangeFontSheetState();
}

class _ChangeFontSheetState extends State<ChangeFontSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VoiceRecognitionProvider>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.primaryContainer.withOpacity(0.3),
        ),
        // color:
        //     theme.colorScheme.primaryContainer.withOpacity(0.3),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('change_style'.tr(context),
                    style: const TextStyle(fontSize: 20, color: Colors.white))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: Colors.white60),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("size".tr(context),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white)),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.05,
                            onPressed: () {
                              value.increaseTextSize();
                            },
                            icon: const Icon(Icons.add),
                          ),
                          Spacer(),
                          IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.05,
                            onPressed: () {
                              value.decreaseTextSize();
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("alignment".tr(context),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              value.switchAlign();
                            },
                            child: Text(
                              value.textAlignIndx == 0
                                  ? 'left'.tr(context)
                                  : value.textAlignIndx == 1
                                      ? "center".tr(context)
                                      : 'right'.tr(context),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("font_weight".tr(context),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              value.switchFontWeight();
                            },
                            child: Text("${value.fontWeight}"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
