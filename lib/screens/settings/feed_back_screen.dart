import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReusesableAppBar2(
          appBarTitle: 'Feedback',
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
      body: SizedBox(
        height: 800.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              NormalText(
                text:
                    'Have Feedback? We would love to hear it, but please don\'t share sensitive information.',
                fontWeight: FontWeight.w400,
                size: 14.sp,
                color: kBlack,
              ),
              NormalText(
                text: 'Please enter your feedback here',
                fontWeight: FontWeight.w400,
                size: 14.sp,
                color: kBlack,
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 300.h,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  expands: true,
                  maxLength: 300,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor, width: 1.0.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0.w),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
                    ),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
                    labelStyle:
                        TextStyle(color: Colors.black54, fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
                 TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'For technical support,please ',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: kBlack),
                      ),
                      TextSpan(
                        text: 'Contact Us',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: kMainColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
                SizedBox(
                height: 15.h,
              ),
              ReuseableButton(
                onPressed: () {},
                text: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }
}
