import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/View/LanguageScreen/languageScreen.dart';
import 'package:dfvue/View/VoiceRecognition/SettingsBottomSheet/changeLanguageSheet.dart';
import 'package:dfvue/app_export.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settingssheet extends StatefulWidget {
  const Settingssheet({super.key});

  @override
  State<Settingssheet> createState() => _SettingssheetState();
}

class _SettingssheetState extends State<Settingssheet> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var iconSize = screenSize.width * 0.08; // Adjust based on screen width
    var textSize = screenSize.width * 0.04; // Adjust based on screen width
    return FractionallySizedBox(
        heightFactor: 0.75,
        child: Scaffold(
          backgroundColor: theme.colorScheme.primary,
          body: Consumer<AppProvider>(
            builder: (context, provider, child) {
              return Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                color: Colors.white,
                                onPressed: () {},
                                icon: const Icon(Icons.settings_outlined),
                                isSelected: null,
                                iconSize: iconSize,
                                style: IconButton.styleFrom(
                                  shape: const RoundedRectangleBorder(),
                                  backgroundColor: Colors.white30,
                                )),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  color: Colors.white, fontSize: textSize),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: const Icon(Icons.color_lens),
                              isSelected: null,
                              iconSize: iconSize,
                            ),
                            Text(
                              "Colors",
                              style: TextStyle(
                                  color: Colors.white, fontSize: textSize),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: const Icon(Icons.text_fields_outlined),
                              isSelected: null,
                              iconSize: iconSize,
                            ),
                            Text(
                              "Fonts",
                              style: TextStyle(
                                  color: Colors.white, fontSize: textSize),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.white60),
                    const SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: ChangeLanguageSheet(),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
