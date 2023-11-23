import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'dart:io';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReusesableAppBar2(
          appBarTitle: 'Contact Us',
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
      body: SizedBox(
        height: 800.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: kMainColor,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  NormalText(
                    text: 'Call',
                    color: Colors.black,
                    size: 18,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(height: 15.h,),
              SizedBox(
                height: 100.h,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 335.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kBlackDull,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: NormalText(
                            text: '+234 9039539042', color: kBlack, size: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                     Container(
                      width: 335.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kBlackDull,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: NormalText(
                            text: '+234 9039539042', color: kBlack, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: kMainColor,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  NormalText(
                    text: 'Email',
                    color: Colors.black,
                    size: 18,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Container(
                      width: 335.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kBlackDull,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: NormalText(
                            text: 'craftsmen.com', color: kBlack, size: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kBlackDull,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: NormalText(
                            text: 'craftsmen.com', color: kBlack, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
