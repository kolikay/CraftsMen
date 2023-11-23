// ignore_for_file: must_be_immutable

import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final double? width;
  double? height = 50.h;
  final double textSize;
  final bool isActive;
  final Color backGroundColor;
  final Color textColor;
  final bordercolor;

  ReuseableButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.textSize = 16,
    this.width = 327,
    this.isActive = true,
    this.backGroundColor = kMainColor,
    this.textColor = Colors.white,
    this.bordercolor = kMainColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: bordercolor),
        borderRadius: BorderRadius.circular(5.r),
        color: bordercolor,
      ),
      // margin: EdgeInsets.fromLTRB(20.0.w, 0.0.h, 20.0.w, 0.0.h),
      height: height,
      width: width,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            backgroundColor: backGroundColor,
            minimumSize: Size.fromHeight(70.h),
            primary: kWhite,
          ),
          onPressed: isActive ? onPressed : null,
          child: NormalText(
            size: textSize,
            color: textColor,
            fontWeight: FontWeight.normal,
            text: text,
          )),
    );
  }
}
