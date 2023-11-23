import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'dart:io';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  bool showAnswer1 = false;
  bool showAnswer2 = false;
  bool showAnswer3 = false;
  bool showAnswer4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReusesableAppBar2(
          appBarTitle: 'FAQs',
          firstButton: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kMainColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 850.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                NormalText(
                  text: 'Some Frequestly asked questions are:',
                  fontWeight: FontWeight.w500,
                  size: 16.sp,
                ),
                SizedBox(height: 24.h),
                faqsCards(
                    'How do I pay for the service provider \nafter getting the service done?',
                    () {
                  setState(() {
                    showAnswer1 = !showAnswer1;
                  });
                }, showAnswer1),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                  visible: showAnswer1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 185, 195, 221),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 104.h,
                    width: 327.w,
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: Text(
                        'You will receive notification once your request has been granted. On the main page, you will see a bell icon. Click on it and it will lead you to a page where notification messages are saved. ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                faqsCards('How do I chat/call the service provider?', () {
                  setState(() {
                    showAnswer2 = !showAnswer2;
                  });
                }, showAnswer2),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                  visible: showAnswer2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 185, 195, 221),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 104.h,
                    width: 327.w,
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: Text(
                        'You will receive notification once your request has been granted. On the main page, you will see a bell icon. Click on it and it will lead you to a page where notification messages are saved. ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                faqsCards(
                    'How can i make a schedule for my\nday to day activities?',
                    () {
                  setState(() {
                    showAnswer3 = !showAnswer3;
                  });
                }, showAnswer3),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                  visible: showAnswer3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 185, 195, 221),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 104.h,
                    width: 327.w,
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: Text(
                        'You will receive notification once your request has been granted. On the main page, you will see a bell icon. Click on it and it will lead you to a page where notification messages are saved. ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                    ),
                  ),
                ),
                faqsCards(
                    'How do I get notified that the service \nprovider has accepted my request?',
                    () {
                  setState(() {
                    showAnswer4 = !showAnswer4;
                  });
                }, showAnswer4),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                  visible: showAnswer4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 185, 195, 221),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 104.h,
                    width: 327.w,
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: Text(
                        'You will receive notification once your request has been granted. On the main page, you will see a bell icon. Click on it and it will lead you to a page where notification messages are saved. ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  faqsCards(String cardMessage, GestureTapCallback onPressed, bool showAnswer) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 65.h,
        width: 335.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: NormalText(
                text: cardMessage,
                fontWeight: FontWeight.w400,
                size: 14.sp,
                color: Colors.black54,
              ),
            ),
            Icon(
              showAnswer ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
