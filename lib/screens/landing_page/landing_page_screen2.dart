import 'package:craftsmen/constants/const/cached_network_mage.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:craftsmen/screens/auth/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage2 extends StatelessWidget {
  LandingPage2({Key? key}) : super(key: key);
  static const id = "landingPage2";

  final auth = AuthViewModel.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 90.h,
              width: 70.w,
              child: Image.asset('lib/assets/logoTrans.png'),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 50.h,
              width: 330.w,
              child: Text(
                'Forget the old rules. You can have the best people here',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            NormalText(
              text: 'Rigth now. Right here',
              color: kMainColor,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 30,
            ),
            const CachedImage(
              imageUrl: 'https://i.imgur.com/wUXlPWZ.png',
              width: 323,
              height: 187,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'I want to sign up as;',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReuseableButton(
                  backGroundColor: kMainColor,
                  textColor: kWhite,
                  text: 'Skill Provider',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                          const  SignUpScreen(userType: "Skill Providers"),
                      ),
                    );
                  },
                  width: 137.w,
                ),
                ReuseableButton(
                  backGroundColor: kWhite,
                  textColor: kMainColor,
                  text: 'User',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>const SignUpScreen(userType: "Users"),
                      ),
                    );
                  },
                  width: 137.w,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'You have an account? ',
                            style: TextStyle(fontSize: 14.sp)),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: kMainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
