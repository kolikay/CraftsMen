// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreen extends ConsumerStatefulWidget {
  const ServiceDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends ConsumerState<ServiceDetailsScreen> {
  // TextEditingController dateInput = TextEditingController();
  String? dateInpute;
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return Stack(children: [
      Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReusesableAppBar2(
            appBarTitle: 'Service Details',
            firstButton: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kMainColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 800.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  NormalText(
                    text:
                        'Select Date and Time you want the service to be done.',
                    fontWeight: FontWeight.w600,
                    size: 16.sp,
                    color: kBlack,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: 'Date.',
                            size: 14.sp,
                            color: kBlackDull,
                          ),
                          InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              setState(() {
                                dateInpute =
                                    pickedDate.toString().substring(0, 10);
                              });
                            },
                            child: Container(
                              width: 153.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: kBlackDull),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    NormalText(
                                      text: dateInpute ?? 'Select Date',
                                      color: kBlack,
                                      size: 15,
                                    ),
                                    // SizedBox(height:150, width:100,child: TextField(controller: dateInput,)),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kMainColor,
                                      size: 14.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: 'Time.',
                            size: 14.sp,
                            color: kBlackDull,
                          ),
                          Container(
                            width: 153.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: kBlackDull),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SizedBox(
                              width: 153.w,
                              height: 48.h,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10.w, bottom: 5.h),
                                  border: InputBorder.none,
                                  hintText: 'Enter Time',
                                  hintStyle:
                                      TextStyle(color: kBlack, fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        text: 'Service Description.',
                        size: 15.sp,
                        color: kBlackDull,
                      ),
                      SizedBox(
                        height: 300.h,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.top,
                          expands: true,
                          maxLength: 300,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter more details about the service',
                            hintStyle:
                                TextStyle(color: kBlackDull, fontSize: 16.sp),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kMainColor, width: 1.0.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0.w),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 1.0.w),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ReuseableButton(
                    onPressed: () async {
           

                      bottomSheet(context);
                    },
                    text: 'Submit',
                  )
                ],
              ),
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
    ]);
  }

  bottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      context: context,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: const BoxDecoration(
            color: kDarkContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 504.h,
          width: 375,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 90.h.h,
                width: 80.w,
                child: Image.asset(
                  'lib/assets/verifiedIcon.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              NormalText(
                text: 'Booking ID: 4231A',
                color: kMainColor,
                size: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 15.h,
              ),
              // NormalText(
              //   text:
              //       'Hire request has been sent to Ali Mahmud. You will be notify when your request is accepted.',
              //   color: kBlack,
              //   size: 15.sp,
              //   fontWeight: FontWeight.w400,
              // ),
              Text(
                
                'Hire request has been sent to Ali Mahmud. You will be notify when your request is accepted or otherwise, Thank you.',
                textAlign: TextAlign.center,
                style: TextStyle(color: kBlack, fontSize: 15.sp, fontWeight: FontWeight.w400, ),
              ),
              SizedBox(
                height: 15.h,
              ),
              NormalText(
                text: 'Contact: Ali Mahmud',
                color: kBlack,
                size: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 35.sp,
                        color: kMainColor,
                      ),
                      NormalText(
                        text: 'Call',
                        color: kBlack,
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.chat_outlined,
                        size: 35.sp,
                        color: kMainColor,
                      ),
                      NormalText(
                        text: 'Chat',
                        color: kBlack,
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReuseableButton(
                    backGroundColor: Colors.white,
                    bordercolor: Colors.red,
                    textColor: Colors.red,
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    width: 150,
                  ),
                  ReuseableButton(
                    text: 'Go home',
                    onPressed: () {
                      Navigator.pushNamed(context, OnBoardingScreen.id);
                    },
                    width: 150,
                  ),
                
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
