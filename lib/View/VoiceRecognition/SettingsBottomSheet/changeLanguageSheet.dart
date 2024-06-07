import 'package:dfvue/Providers/app_provider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/theme/theme_helper.dart';
import 'package:flutter/material.dart';
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Change Language',
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
                      Text("lbl_spoken_language".tr(context),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                      DropdownButton<String>(
                        dropdownColor: theme.hoverColor.withOpacity(0.8),
                        value: selectedSpoken,
                        hint: const Text('Select Subtitle '),
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text(
                              'English',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text(
                              'العربية',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("msg_select_app_language".tr(context),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                      DropdownButton<String>(
                        dropdownColor: theme.hoverColor.withOpacity(0.8),
                        value: selectedSubtitle,
                        hint: const Text('Select Subtitle '),
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text('English'),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text('العربية'),
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
