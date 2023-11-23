import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class RateUsScreen extends StatefulWidget {
  const RateUsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: SizedBox(
          height: 230.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Padding(
              padding: EdgeInsets.all(5.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  NormalText(
                    text: 'Rate Our App',
                    fontWeight: FontWeight.w500,
                    size: 19,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NormalText(
                    text:
                        'If you enjoyed using our app, Please take a moment to rate it on playstore.\nThanks for your support.',
                    fontWeight: FontWeight.w400,
                    size: 14,
                    color: kBlackDull,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: NormalText(
                          text: 'LATER',
                          size: 14,
                          fontWeight: FontWeight.w500,
                          color: kMainColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: NormalText(
                          text: 'NO, THANKS',
                          size: 14,
                          fontWeight: FontWeight.w500,
                          color: kMainColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: NormalText(
                          text: 'RATE',
                          size: 14,
                          fontWeight: FontWeight.w500,
                          color: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
