
// ignore_for_file: file_names

import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusesableAppBar2 extends StatelessWidget {
  final String appBarTitle;
  final IconButton firstButton;
  final IconButton? secondButton;

  const ReusesableAppBar2(
      {Key? key,
      required this.appBarTitle,
      required this.firstButton,
      this.secondButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(
          top: 10.0.h,
        ),
        child: NormalText(
          text: appBarTitle,
          fontWeight: FontWeight.w500,
          color: kMainColor,
        ),
      ),
      toolbarHeight: 103.h,
       backgroundColor: Colors.white,
      leading: Center(
        child: Padding(
            padding: EdgeInsets.only(
              top: 10.0.h,
            ),
            child: firstButton),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(top: 10.0.h, right: 10.w),
            child: secondButton)
      ],
    );
  }
}
