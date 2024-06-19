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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Change Style',
                    style: TextStyle(fontSize: 20, color: Colors.white))
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Size",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.07,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.05,
                            onPressed: () {
                              value.increaseTextSize();
                            },
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.05,
                            onPressed: () {
                              value.decreaseTextSize();
                            },
                            icon: Icon(Icons.remove),
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
                    Text("Text",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.07,
                      width: MediaQuery.of(context).size.width * 0.25,
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
                                  ? 'Left'
                                  : value.textAlignIndx == 1
                                      ? "center"
                                      : 'right',
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
                    Text("Font weight",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.07,
                      width: MediaQuery.of(context).size.width * 0.25,
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
