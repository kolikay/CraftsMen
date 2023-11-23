import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Stack(
            children: [
              SizedBox(
                height: 130.h,
                child: Center(
                  child: SizedBox(
                    height: 125.h,
                    width: 121.21.w,
                    child: Image.asset(
                      'lib/assets/logoTrans.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          const Divider(
            color: kDarkContainer,
            thickness: 0.9,
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(
                  text: 'Welcome to Craftsmen!',
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
                SizedBox(
                  height: 30.h,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Craftsmen',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: kMainColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            """  is a platform that makes it easy for people seeking for service to get the best service from the best service provider. """,
                        style: TextStyle(
                            height: 2.h,
                            fontSize: 14.sp,
                            color: kBlack,
                            ),
                      ),
                      
                    ],
                  ),
                ),
                 SizedBox(
                  height: 30.h,
                ),
                   NormalText(
                  text: 'Why you need to choose Craftsmen',
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
                SizedBox(
                  height: 30.h,
                ),
                   NormalText(
                  text: 'How Craftsmen planned to help you',
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
