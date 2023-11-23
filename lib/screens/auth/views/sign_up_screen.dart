import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/screens/auth/views/login_screen.dart';
import 'package:craftsmen/screens/auth/views/sign_up2_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  String? userType;
  SignUpScreen({Key? key, this.userType}) : super(key: key);
  static const String id = 'sign_up_screen';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCont = TextEditingController();
  final _lastNameCont = TextEditingController();
  final _usernameCont = TextEditingController();
  final _phoneNumber = TextEditingController();

// Initial Selected Value
  String dropdownvalue = 'Male';

  String? location;

  // List of items in our dropdown menu
  var genders = [
    'Male',
    'Female',
    'Others',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   location = UserPreferences.getUserLocation() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 30.w, right: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 125.h,
                      width: 121.w,
                      child: Image.asset(
                        'lib/assets/logoTrans.png',
                        fit: BoxFit.contain,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 36.h,
                      ),
                      NormalText(
                        text: 'Create Account',
                        size: 23.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              MyTextField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field Cannot be empty';
                                  }
                                  return null;
                                },
                                controller: _firstNameCont,
                                obcureText: false,
                                keyBoardType: TextInputType.text,
                                isPassword: false,
                                isReadOnly: false,
                                labelText: 'First Name',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              MyTextField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field Cannot be empty';
                                  }
                                  return null;
                                },
                                controller: _lastNameCont,
                                obcureText: false,
                                keyBoardType: TextInputType.text,
                                isPassword: false,
                                isReadOnly: false,
                                labelText: 'Last Name',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              MyTextField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field Cannot be empty';
                                  }
                                  return null;
                                },
                                controller: _usernameCont,
                                obcureText: false,
                                keyBoardType: TextInputType.text,
                                isPassword: false,
                                isReadOnly: false,
                                labelText: 'User Name',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              MyTextField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field Cannot be empty';
                                  } else if (val.length < 11) {
                                    return 'Phone Number must be 11 digits';
                                  } else if (val.length > 11) {
                                    return 'Phone Number must be 11 digits';
                                  }
                                  return null;
                                },
                                controller: _phoneNumber,
                                obcureText: false,
                                keyBoardType: TextInputType.phone,
                                isPassword: false,
                                isReadOnly: false,
                                labelText: 'Phone Number',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 343.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isDense: false,
                                    isExpanded: true,
                                    // Initial Value
                                    value: dropdownvalue,
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    // Array list of items
                                    items: genders.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReuseableButton(
                            width: 312.w,
                            text: 'Next',
                            textSize: 16.sp,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen2(
                                      fullName:
                                          "${_firstNameCont.text} ${_lastNameCont.text}",
                                      userName: _usernameCont.text,
                                      phoneNumber: _phoneNumber.text,
                                      gender: dropdownvalue,
                                      address: location!,
                                      userType: widget.userType,
                                    ),
                                  ),
                                );
                              }
                              FocusScope.of(context).unfocus();
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
                                  text: 'Already have an account? ',
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
                  )
                ],
              ),
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
      ]),
    );
  }
}
