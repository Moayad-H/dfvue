import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/Providers/settingsProvider.dart';
import 'package:dfvue/View/VoiceRecognition/SettingsBottomSheet/changeLanguageSheet.dart';
import 'package:dfvue/View/VoiceRecognition/SettingsBottomSheet/change_color_sheet.dart';
import 'package:dfvue/View/VoiceRecognition/SettingsBottomSheet/change_font_sheet.dart';
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
  int _selectedScreenIndex = 0;

  void _onIconPressed(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var iconSize = screenSize.width * 0.08; // Adjust based on screen width
    var textSize = screenSize.width * 0.04; // Adjust based on screen width
    return FractionallySizedBox(
        heightFactor: 0.75,
        child: Scaffold(
          backgroundColor: theme.colorScheme.primary,
          body: Consumer2<AppProvider, SettingsProvider>(
            builder: (context, provider, isChosen, child) {
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
                                onPressed: () {
                                  _onIconPressed(0);
                                },
                                icon: const Icon(Icons.settings_outlined),
                                isSelected: null,
                                iconSize: iconSize,
                                style: IconButton.styleFrom(
                                  shape: const RoundedRectangleBorder(),
                                  backgroundColor: _selectedScreenIndex == 0
                                      ? Colors.white30
                                      : null,
                                )),
                            Text(
                              "lbl_settings".tr(context),
                              style: TextStyle(
                                  color: Colors.white, fontSize: textSize),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  _onIconPressed(1);
                                },
                                icon: const Icon(Icons.color_lens),
                                isSelected: null,
                                iconSize: iconSize,
                                style: IconButton.styleFrom(
                                  shape: const RoundedRectangleBorder(),
                                  backgroundColor: _selectedScreenIndex == 1
                                      ? Colors.white30
                                      : null,
                                )),
                            Text(
                              "lbl_colors".tr(context),
                              style: TextStyle(
                                  color: Colors.white, fontSize: textSize),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  _onIconPressed(2);
                                },
                                icon: const Icon(Icons.text_fields_outlined),
                                isSelected: null,
                                iconSize: iconSize,
                                style: IconButton.styleFrom(
                                  shape: const RoundedRectangleBorder(),
                                  backgroundColor: _selectedScreenIndex == 2
                                      ? Colors.white30
                                      : null,
                                )),
                            Text(
                              "lbl_fonts".tr(context),
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
                        child: _selectedScreenIndex == 0
                            ? const ChangeLanguageSheet()
                            : _selectedScreenIndex == 1
                                ? const ChangeColorSheet()
                                : const ChangeFontSheet())
                  ],
                ),
              );
            },
          ),
        ));
  }
}
