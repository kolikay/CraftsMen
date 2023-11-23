import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> dialogBuilder(BuildContext context, String logo, String maintext,
    String detailsText, String bottonText, GestureTapCallback onPressed) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 410.h,
          width: 340.w,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 80.h,
                width: 80.w,
                child: Image.asset(
                  logo,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              NormalText(
                text: maintext,
                size: 20.h,
                fontWeight: FontWeight.w500,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.h),
                child: Text(
                  detailsText,
                  style: TextStyle(fontSize: 15.sp, color: kBlack),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ReuseableButton(
                text: bottonText,
                textSize: 14,
                onPressed: onPressed,
                width: 220.w,
              ),
            ],
          ),
        ),
      );
    },
  );
}

