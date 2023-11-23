import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'dart:io';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;
  bool val5 = false;

  onChancedFunction1(bool newValue1) {
    setState(() {
      val1 = newValue1;
    });
  }

  onChancedFunction2(bool newValue2) {
    setState(() {
      val2 = newValue2;
    });
  }

  onChancedFunction3(bool newValue3) {
    setState(() {
      val3 = newValue3;
    });
  }

  onChancedFunction4(bool newValue4) {
    setState(() {
      val4 = newValue4;
    });
  }

  onChancedFunction5(bool newValue5) {
    setState(() {
      val5 = newValue5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReusesableAppBar2(
          appBarTitle: 'Notifications',
          firstButton: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        color: kDarkContainer,
        height: 800.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              NormalText(text: 'Notify Me About', color: Colors.black45),
              SizedBox(
                height: 24.h,
              ),
              notificationsSwitch('Latest News', val1, onChancedFunction1),
              SizedBox(
                height: 24.h,
              ),
              notificationsSwitch('New Materials', val2, onChancedFunction2),
              SizedBox(
                height: 24.h,
              ),
              notificationsSwitch('Scheduler', val3, onChancedFunction3),
              SizedBox(
                height: 24.h,
              ),
              notificationsSwitch('Scholaships', val4, onChancedFunction4),
              SizedBox(
                height: 24.h,
              ),
              notificationsSwitch('Chat Messages', val5, onChancedFunction5),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationsSwitch(
      String text, bool value, Function onChancedMethod) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NormalText(
          text: text,
          color: Colors.black45,
          size: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        // Platform.isAndroid
        //     ?
        //     Switch(
        //         value: value,
        //         onChanged: (newValue) => setState(() => value = newValue),
        //       )
        //     :
        Transform.scale(
          scale: 0.7.h,
          child: CupertinoSwitch(
            activeColor: kMainColor,
            value: value,
            onChanged: (newValue) {
              onChancedMethod(newValue);
            },
          ),
        ),
      ],
    );
  }
}
