// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusable_info_widget.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/constants/utils/snack_bar.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/landing_page/landing_page_screen.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/details/craftsmen_fill_details_screen.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class VerifyOtpScreen extends ConsumerStatefulWidget {
  final String email;
  final String password;
 final String? userType;
  final Map<String, dynamic> body;
const  VerifyOtpScreen(
      {Key? key,
      required this.email,
      required this.body,
      required this.password,
      this.userType})
      : super(key: key);
  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  bool _isActive = false;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  final otpValue = TextEditingController();

  @override
  initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final userProv = ref.watch(userProvider);
    final skillProv = ref.watch(skillProvider);
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 24.w),
                height: 80.h,
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: kMainColor,
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    NormalText(
                      text: 'Verification',
                      color: kMainColor,
                      size: 19.2.sp,
                      fontWeight: FontWeight.w800,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 26.w, right: 25.w, bottom: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: 'Enter verification code to reset your',
                      size: 16.sp,
                    ),
                    NormalText(
                      text: 'Password',
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w, right: 50.w),
                child: PinCodeTextField(
                  controller: otpValue,
                  keyboardType: TextInputType.number,
                  length: 4,
                  appContext: context,
                  obscureText: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    fieldOuterPadding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: PinCodeFieldShape.box,
                    selectedColor: kMainColor,
                    activeColor: kMainColor,
                    inactiveColor: kBlackDull,
                    borderRadius: BorderRadius.circular(5.r),
                    fieldHeight: 46.h,
                    fieldWidth: 53.w,
                    activeFillColor: Colors.white,
                  ),
                  onChanged: (val) {
                    if (val.length > 3) {
                      setState(() {
                        _isActive = !_isActive;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 50.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NormalText(
                      text: '00.$secondsRemaining' 'sec',
                      color: kBlackDull,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: enableResend ? _resendCode : null,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.sp,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Didn\'t you receive an Otp? ',
                          style: TextStyle(color: kBlackDull, fontSize: 16.sp)),
                      TextSpan(
                        text: 'Resend Code',
                        style: TextStyle(
                            color: enableResend ? kMainColor : kBlackDull,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              ReuseableButton(
                backGroundColor: kMainColor,
                isActive: true,
                text: 'Verify',
                textSize: 14.sp,
                onPressed: () async {
                  bool verified =
                      await authViewModel.verify(otpValue.text, context);

                  if (verified == true) {
                    var res = await authViewModel.signUpUser(
                        context: context,
                        body: widget.body,
                        password: widget.password,
                        email: widget.email,
                        userType: widget.userType!);

                    // check what type of user registered
                    if (widget.userType == 'Users') {
                    await  userProv.updateLoggedinUserLocations(widget.userType!);
                      if (res != 'Success') {
                        Navigator.pushNamed(context, LandingPage.id);
                        ShowSnackBar.buildErrorSnackbar(
                            context, res!, Colors.red);
                      } else {
                        dialogBuilder(
                            context,
                            'lib/assets/emailverifiedicon.png',
                            'Account Created',
                            'Your account has been Created and verified successfully,',
                            'Proceed', () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OnBoardingScreen(
                                user: widget.userType,
                              ),
                            ),
                          );
                        });
                      }
                    } else if (widget.userType == 'Skill Providers') {
                     await skillProv.updateLoggedinUserLocations(widget.userType!);
                      if (res != 'Success') {
                        Navigator.pushNamed(context, LandingPage.id);
                        ShowSnackBar.buildErrorSnackbar(
                            context, res!, Colors.red);
                      } else {
                        dialogBuilder(
                            context,
                            'lib/assets/emailverifiedicon.png',
                            'Account Created',
                            'Your account has been Created and verified successfully, Please Tell Us a bit more about your skills,',
                            'Proceed', () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CraftmenFillDetailsScreen(
                                user: widget.userType,
                              ),
                            ),
                          );
                        });
                      }
                    }
                  } else {
                    UserPreferences.resetSharedPref();
                    ShowSnackBar.buildErrorSnackbar(
                        context, 'Incorrect OTP', Colors.red);
                  }
                },
              ),
            ],
          ),
        ),
        Positioned(
          child: authViewModel.loading
              ? const Center(
                  child: ProgressDialog(
                    message: 'Loading....',
                  ),
                )
              : const SizedBox(),
        ),
      ]),
    );
  }

  void _resendCode() {
    AuthViewModel.instance.sendOtp(widget.email, context);
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }
}
