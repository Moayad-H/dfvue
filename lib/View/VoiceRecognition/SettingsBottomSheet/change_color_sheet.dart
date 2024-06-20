import 'package:dfvue/Providers/voice_recognition_provider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeColorSheet extends StatefulWidget {
  const ChangeColorSheet({super.key});

  @override
  State<ChangeColorSheet> createState() => _ChangeColorSheetState();
}

class _ChangeColorSheetState extends State<ChangeColorSheet> {
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
                Text('change_colors'.tr(context),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("msg_light_and_dark_mode".tr(context),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white)),
                    Spacer(),
                    DropdownButton<String>(
                      dropdownColor: theme.hoverColor.withOpacity(0.8),
                      value: value.colorMode,
                      items: [
                        DropdownMenuItem(
                          value: 'light',
                          child: Text(
                            'light'.tr(context),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'dark',
                          child: Text(
                            'dark'.tr(context),
                          ),
                        ),
                      ],
                      onChanged: (newVal) {
                        value.switchColorMode(newVal);
                      },
                      style: const TextStyle(fontSize: 20, color: Colors.white),
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
