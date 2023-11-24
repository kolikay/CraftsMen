// ignore_for_file: use_build_context_synchronously
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogOutScreen extends ConsumerStatefulWidget {
  const LogOutScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends ConsumerState<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: SizedBox(
          height: 278.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                NormalText(
                  text: 'Log Out',
                  fontWeight: FontWeight.w500,
                  size: 23.sp,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  color: kDarkContainer,
                  thickness: 1.h,
                ),
                SizedBox(
                  height: 14.h,
                ),
                NormalText(
                  text: 'Are you sure you want to log out?',
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
                SizedBox(
                  height: 14.h,
                ),
                ReuseableButton(
                    bordercolor: Colors.red,
                    backGroundColor: Colors.red,
                    textColor: Colors.white,
                    width: 220.w,
                    height: 50.h,
                    text: 'Yes',
                    onPressed: () async {
                      await AuthViewModel.instance.logOut(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.id, (Route<dynamic> route) => false);
                    }),
                SizedBox(
                  height: 15.h,
                ),
                ReuseableButton(
                    bordercolor: kMainColor,
                    backGroundColor: kWhite,
                    textColor: kMainColor,
                    width: 220.w,
                    height: 50.h,
                    text: 'No',
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
