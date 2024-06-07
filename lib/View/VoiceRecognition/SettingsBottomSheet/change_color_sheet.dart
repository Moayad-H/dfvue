import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class ChangeColorSheet extends StatefulWidget {
  const ChangeColorSheet({super.key});

  @override
  State<ChangeColorSheet> createState() => _ChangeColorSheetState();
}

class _ChangeColorSheetState extends State<ChangeColorSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text('Change Colors',
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
                  Text("msg_light_and_dark_mode".tr(context),
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
                  DropdownButton<String>(
                    dropdownColor: theme.hoverColor.withOpacity(0.8),
                    //value: selectedSpoken,
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
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
