// import 'dart:async';

// import 'package:craftsmen/constants/const/color.dart';
// import 'package:craftsmen/constants/reusesable_widgets/reusable_info_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
// import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';

// import 'enter_newpassword_screen.dart';

// class PasswordResetPinScreen extends StatefulWidget {
//     final String email;
//   const PasswordResetPinScreen({Key? key, required this.email}) : super(key: key);
//   static const String id = 'password_resetpin_screen';

//   @override
//   State<PasswordResetPinScreen> createState() => _PasswordResetPinScreenState();
// }

// class _PasswordResetPinScreenState extends State<PasswordResetPinScreen> {
//   bool _isActive = false;
//   int secondsRemaining = 30;
//   bool enableResend = false;
//   Timer? timer;

//   @override
//   initState() {
//     super.initState();
//     timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       if (secondsRemaining != 0) {
//         setState(() {
//           secondsRemaining--;
//         });
//       } else {
//         setState(() {
//           enableResend = true;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 24.w),
//             color: Colors.white,
//             height: 80.h,
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.arrow_back_ios,
//                   color: kMainColor,
//                 ),
//                 SizedBox(
//                   width: 28.w,
//                 ),
//                 NormalText(
//                   text: 'Verification',
//                   color: kMainColor,
//                   size: 19.2.sp,
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 26.w, right: 25.w),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 NormalText(
//                   text: 'Enter verification code to reset your',
//                   size: 16.sp,
//                 ),
//                 NormalText(
//                   text: 'Password',
//                   size: 16.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 25.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 50.w, right: 50.w),
//             child: PinCodeTextField(
//               keyboardType: TextInputType.number,
//               length: 4,
//               appContext: context,
//               obscureText: true,
//               animationType: AnimationType.fade,
//               pinTheme: PinTheme(
//                 fieldOuterPadding: EdgeInsets.symmetric(vertical: 15.h),
//                 shape: PinCodeFieldShape.box,
//                 selectedColor: kMainColor,
//                 activeColor: kMainColor,
//                 inactiveColor: kBlackDull,
//                 borderRadius: BorderRadius.circular(5.r),
//                 fieldHeight: 46.h,
//                 fieldWidth: 53.w,
//                 activeFillColor: Colors.white,
//               ),
//               onChanged: (val) {
//                 if (val.length > 3) {
//                   setState(() {
//                     _isActive = !_isActive;
//                   });
//                 }
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: 50.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 NormalText(
//                   text: '00.$secondsRemaining' 'sec',
//                   color: kBlackDull,
//                 ),
//               ],
//             ),
//           ),
//           TextButton(
//             onPressed: enableResend ? _resendCode : null,
//             child: RichText(
//               text: TextSpan(
//                 style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 16.sp,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: 'Didn\'t you receive an Otp? ',
//                       style: TextStyle(color: kBlackDull, fontSize: 16.sp)),
//                   TextSpan(
//                     text: 'Resend Code',
//                     style: TextStyle(
//                         color: enableResend ? kMainColor : kBlackDull,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18.sp),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 45.h,
//           ),
//           ReuseableButton(
//             backGroundColor: _isActive ? kMainColor : kBlackDull,
//             isActive: _isActive,
//             text: 'Verify',
//             textSize: 14.sp,
//             onPressed: () {
//               dialogBuilder(
//                   context,
//                   'lib/assets/emailverifiedicon.png',
//                   'Verification Successfull',
//                   'Your account has been verified successfully, Proceed to set a new password.',
//                   'Proceed', () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => NewPasswordScreen(email: widget.email,),
//                   ),
//                 );
//               });
//             },
//           ),
//         ],
//       ),
//     ));
//   }

//   void _resendCode() {
//     //other code here
//     setState(() {
//       secondsRemaining = 30;
//       enableResend = false;
//     });
//   }

//   @override
//   dispose() {
//     timer!.cancel();
//     super.dispose();
//   }
// }
