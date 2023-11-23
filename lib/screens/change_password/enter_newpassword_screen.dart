// // ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

// import 'package:craftsmen/constants/const/app_state_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:craftsmen/constants/const/color.dart';
// import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
// import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
// import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';

// class NewPasswordScreen extends ConsumerStatefulWidget {
//   final String email;
//   const NewPasswordScreen({Key? key, required this.email}) : super(key: key);
//   static const String id = 'new_password_screen';
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _NewPasswordScreenState();
// }

// class _NewPasswordScreenState extends ConsumerState<NewPasswordScreen> {
//   final _newpassword1 = TextEditingController();
//   final _newpassword2 = TextEditingController();
//   bool _isObscure = true;
//   bool _isObscure1 = true;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     _formKey;
//     _newpassword1;
//     _newpassword2;
//     super.dispose();
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
//                   text: 'Create Your New Password',
//                   color: kMainColor,
//                   size: 19.2.sp,
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 26.w, right: 25.w),
//             child: NormalText(
//               text: 'Enter your new Passwords',
//               size: 16.sp,
//             ),
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 MyTextField(
//                   controller: _newpassword1,
//                   obcureText: _isObscure,
//                   keyBoardType: TextInputType.text,
//                   isPassword: false,
//                   isReadOnly: false,
//                   labelText: 'Password',
//                   sufixIcon: IconButton(
//                     color: Colors.black54,
//                     icon: Icon(
//                         _isObscure ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40.h,
//                 ),
//                 MyTextField(
//                   validator: (pass) {
//                     if (_newpassword2.text != _newpassword1.text) {
//                       return 'Password Dont match';
//                     }
//                     return null;
//                   },
//                   controller: _newpassword2,
//                   obcureText: _isObscure,
//                   keyBoardType: TextInputType.emailAddress,
//                   isPassword: false,
//                   isReadOnly: false,
//                   labelText: 'Confirm password',
//                   sufixIcon: IconButton(
//                     color: Colors.black54,
//                     icon: Icon(
//                         _isObscure1 ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure1 = !_isObscure1;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 40.h,
//           ),
//           ReuseableButton(
//             text: 'Send Email',
//             textSize: 14.sp,
//             onPressed: () async {
//               // try {
//               //   String res = await userProv.updateLoggedinUserPassword(
//               //     widget.email,
//               //   );

//               //   if (res == 'Success') {
//               //     dialogBuilder(
//               //         context,
//               //         'lib/assets/emaillockicon.png',
//               //         'Reset Password',
//               //         'Your password has been changed successfully',
//               //         'Proceed', () {
//               //       Navigator.of(context).push(
//               //         MaterialPageRoute(
//               //           builder: (context) => const LoginScreen(),
//               //         ),
//               //       );
//               //     });
//               //   }
//               // } catch (e) {
//               //   print(e.toString());
//               // }
//             },
//           ),
//         ],
//       ),
//     ));
//   }
// }
