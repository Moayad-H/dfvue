import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChangeLanguageSheet extends StatefulWidget {
  const ChangeLanguageSheet({super.key});

  @override
  State<ChangeLanguageSheet> createState() => _ChangeLanguageSheetState();
}

class _ChangeLanguageSheetState extends State<ChangeLanguageSheet> {
  @override
  Widget build(BuildContext context) {
    String? selectedSpoken = "en"; // Default value for spoken language
    String? selectedSubtitle = 'en';
    return Consumer<AppProvider>(
      builder: (context, language, child) {
        selectedSubtitle = language.locale!.languageCode;
        selectedSpoken = language.spokenLocale!.languageCode;
        return Container(
          padding: const EdgeInsets.all(6.0),
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
                  Text('change_language'.tr(context),
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
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("lbl_spoken_language".tr(context),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white)),
                      ),
                      Spacer(),
                      DropdownButton<String>(
                        dropdownColor: theme.hoverColor.withOpacity(0.8),
                        value: selectedSpoken,
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text(
                              'English',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text(
                              'العربية',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                        onChanged: (newVal) {
                          setState(() {
                            language.setSpokenLocale(Locale(newVal!));
                          });
                        },
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("msg_select_app_language".tr(context),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white)),
                      ),
                      Spacer(),
                      DropdownButton<String>(
                        dropdownColor: theme.hoverColor.withOpacity(0.8),
                        value: selectedSubtitle,
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text(
                              'English',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text(
                              'العربية',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                        onChanged: (newVal) {
                          setState(() {
                            language.setLocale(Locale(newVal!));
                          });
                        },
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
