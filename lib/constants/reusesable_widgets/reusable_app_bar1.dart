import 'package:craftsmen/constants/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'normal_text.dart';

// ignore: must_be_immutable
class ReuseableAppBar1 extends StatelessWidget {
  final IconButton firstAppIcon;
  final IconButton secondAppIcon;
  final IconButton? thirdAppIcon;
  final NormalText? title;
   final Color? backGroundColor;
   const ReuseableAppBar1(
      {Key? key,
      required this.firstAppIcon,
      required this.secondAppIcon,
      this.backGroundColor = kMainColor,
      this.thirdAppIcon,
      this.title})///k
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(top: 20.0.h),
        child: title,
      ),
      toolbarHeight: 103.h,
      backgroundColor: backGroundColor,
      leading: Center(
        child:
            Padding(padding: EdgeInsets.only(top: 20.0.h), child: firstAppIcon),
      ),
      actions: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: secondAppIcon,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: thirdAppIcon,
            )
          ],
        )
      ],
    );
  }
}
