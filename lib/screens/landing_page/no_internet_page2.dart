import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetScreen2 extends StatelessWidget {
 final String? user;
 const NoInternetScreen2({Key? key, required this.user}) : super(key: key);
  static const id = 'noInternetPage2';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: kDarkContainer,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        size: 70.w,
                        color: kBlackDull,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      NormalText(
                        text: 'No Internet Connection',
                        size: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      NormalText(
                        text: 'You are offline, please check your connection',
                        color: kBlackDull,
                        size: 14.sp,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ReuseableButton(
                        text: 'Try Again',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OnBoardingScreen(
                                user: user,
                              ),
                            ),
                          );
                        },
                        width: 140.w,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


