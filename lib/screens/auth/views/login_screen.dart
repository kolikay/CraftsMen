// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/constants/utils/snack_bar.dart';
import 'package:craftsmen/screens/change_password/email_password_change_screen.dart';
import 'package:craftsmen/screens/landing_page/landing_page_screen2.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
   

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 125.h,
                      width: 121.21.w,
                      child: Image.asset(
                        'lib/assets/logoTrans.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        NormalText(
                          text: 'Sign In',
                          size: 23,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        NormalText(
                          text: 'Glad to meet you again',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Visibility(
                          visible: authViewModel.loginError,
                          child: Container(
                            color: Colors.pink[100],
                            height: 100.h,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.h,
                                ),
                                SizedBox(
                                    child: Icon(
                                  Icons.ac_unit,
                                  color: const Color(0xffD32f2f),
                                  size: 24.w,
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                    child: NormalText(
                                  text:
                                      'we didnt recognize that email address \nor password you can try again or use\n another login option',
                                  color: Colors.black54,
                                  size: 14.sp,
                                )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                MyTextField(
                                  key: const Key('testKeyEmail'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'The Email Field is required';
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  obcureText: false,
                                  keyBoardType: TextInputType.emailAddress,
                                  isPassword: false,
                                  isReadOnly: false,
                                  labelText: 'Email Address',
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                MyTextField(
                                    key: const Key('testKeyPassword'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'The password Field is required';
                                      }
                                      return null;
                                    },
                                    controller: passwordController,
                                    obcureText: _isObscure,
                                    keyBoardType: TextInputType.text,
                                    isPassword: true,
                                    isReadOnly: false,
                                    labelText: 'Enter Password',
                                    sufixIcon: IconButton(
                                        color: kBlackDull,
                                        icon: Icon(_isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        })),
                              ],
                            )),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // pushEmailPasswordChangeScreen(context);
                                    Navigator.pushNamed(
                                        context, EmailPasswordChangeScreen.id);
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: NormalText(
                                      size: 14.sp,
                                      text: 'Forgot Password?',
                                      color: kMainColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReuseableButton(
                              height: 55.h,
                              width: 290.h,
                              text: 'Sign In',
                              textSize: 14.sp,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String responce = await authViewModel.signIn(
                                    password: passwordController.text,
                                    email: emailController.text,
                                    context: context
                                  );

                                  if (responce == "Users" ||
                                      responce == "Skill Providers") {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (builder) {
                                      return OnBoardingScreen(
                                        user: responce,
                                      );
                                    }));
                                  } else {
                                    ShowSnackBar.buildErrorSnackbar(
                                        context, responce, Colors.red);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NormalText(
                      text: 'Or Continue with',
                      size: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kBlackDull,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset(
                            'lib/assets/google.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset(
                            'lib/assets/facebook.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset(
                            'lib/assets/twitter.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LandingPage2.id);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Dont have an account? ',
                                    style: TextStyle(fontSize: 14.sp)),
                                TextSpan(
                                  text: 'Sign Up',
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
          ],
        ),
      ),
    );
  }
}
