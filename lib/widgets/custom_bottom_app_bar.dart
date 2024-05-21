import 'package:dfvue/Providers/theme_provider.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dfvue/app_export.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgTrash2Errorcontainer,
        activeIcon: ImageConstant.imgTrash2Errorcontainer,
        type: BottomBarEnum.Trash2errorcontainer,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgDownload,
      activeIcon: ImageConstant.imgDownload,
      type: BottomBarEnum.Download,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSliders,
      activeIcon: ImageConstant.imgSliders,
      type: BottomBarEnum.Sliders,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: 98.v,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomMenuList.length,
              (index) {
                return InkWell(
                  onTap: () {
                    for (var element in bottomMenuList) {
                      element.isSelected = false;
                    }
                    bottomMenuList[index].isSelected = true;
                    widget.onChanged?.call(bottomMenuList[index].type);
                    setState(() {});
                  },
                  child: bottomMenuList[index].isSelected
                      ? CustomImageView(
                          imagePath: bottomMenuList[index].activeIcon,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          color: value.themeData.colorScheme.errorContainer
                              .withOpacity(1),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 51.v,
                              width: 62.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 51.v,
                                      width: 62.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          31.h,
                                        ),
                                        border: Border.all(
                                          color: value
                                              .themeData.colorScheme.primary,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgVoiceSearch4,
                                    height: 30.adaptSize,
                                    width: 30.adaptSize,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(
                                        16.h, 10.v, 16.h, 11.v),
                                  ),
                                ],
                              ),
                            ),
                            CustomImageView(
                              imagePath: bottomMenuList[index].icon,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              color: value.themeData.colorScheme.errorContainer
                                  .withOpacity(1),
                              margin: EdgeInsets.only(top: 23.v),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Trash2errorcontainer,
  Download,
  Sliders,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
