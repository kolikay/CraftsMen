import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftsMenNotificationScreen extends StatefulWidget {
  const CraftsMenNotificationScreen({Key? key}) : super(key: key);

  @override
  State<CraftsMenNotificationScreen> createState() => _CraftsMenNotificationScreenState();
}

class _CraftsMenNotificationScreenState extends State<CraftsMenNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 24.w),
            color: Colors.white,
            height: 80.h,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20.w,
                    )),
                SizedBox(
                  width: 28.w,
                ),
                NormalText(
                  text: 'Notifications',
                  color: kMainColor,
                  size: 19.2.sp,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 400.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_alert_sharp,
                      color: kBlackDull,
                      size: 90.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    NormalText(
                      text: 'No Notifications Yet',
                      size: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: kMainColor,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'You can only get notification after hiring a service provider',
                      style: TextStyle(
                          color: kMainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
