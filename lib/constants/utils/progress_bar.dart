import 'package:craftsmen/constants/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../reusesable_widgets/normal_text.dart';

class ProgressDialog extends StatelessWidget {
  final String message;
  const ProgressDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        height: 80.h,
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 6.0.w),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kMainColor),
            ),
            SizedBox(
              width: 26.0.w,
            ),
            NormalText(
              text: message,
              color: kMainColor,
              size: 16.sp,
            )
          ],
        ),
      ),
    );
  }
}

    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return ProgressDialog(message: 'loading, please wait');
    //     });
