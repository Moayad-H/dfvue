import 'package:dfvue/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.validator,
  });

  final String? value;
  final List<T>? items;
  final void Function(String?)? onChanged, onSaved;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4),
          filled: true,
          errorStyle: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: AppStyle.redErrorColor),
          fillColor: AppStyle.offWhite.withOpacity(.33),
          border: OutlineInputBorder(
            borderRadius: AppStyle.defaultBorderRadius,
            borderSide: BorderSide(
              color: AppStyle.greyColor.withOpacity(.33),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppStyle.defaultBorderRadius,
            borderSide: BorderSide(
              color: AppStyle.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppStyle.defaultBorderRadius,
            borderSide: BorderSide(
              color: AppStyle.greyColor.withOpacity(.33),
            ),
          ),
        ),
        hint: Text(
          hintText!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        value: value,
        onSaved: onSaved,
        items: items
            ?.map(
              (T item) => DropdownMenuItem<String>(
                value: item.toString(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: AppStyle.offWhite.withOpacity(.33),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        borderRadius: AppStyle.defaultBorderRadius,
        style: Theme.of(context).textTheme.labelSmall);
  }
}
