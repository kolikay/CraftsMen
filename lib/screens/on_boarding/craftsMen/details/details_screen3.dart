// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusable_info_widget.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/constants/utils/snack_bar.dart';
import 'package:craftsmen/screens/on_boarding/on_boarding_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage3 extends ConsumerStatefulWidget {
  final String? user;
  final String? compName;
  final String? compPhone;
  final String? compEmail;
  final String? compAdd;
  final String? webSiteCont;
  final String? startYear;
  final String? skill;
  final int? employee;
  final int? experience;

  const DetailsPage3(
      {Key? key,
      required this.user,
      this.compAdd,
      this.compEmail,
      this.webSiteCont,
      this.compName,
      this.employee,
      this.skill,
      this.experience,
      this.compPhone,
      this.startYear})
      : super(key: key);

  @override
  ConsumerState<DetailsPage3> createState() => _DetailsPage3State();
}

class _DetailsPage3State extends ConsumerState<DetailsPage3> {
  final _more = TextEditingController();

  _getInputedData() {
    final body = {
      "Company Address": widget.compAdd,
      "Company Name": widget.compName,
      "Company Email": widget.compEmail,
      "Company Website": widget.webSiteCont,
      "Company Phone Number": widget.compPhone,
      "Skill": widget.skill,
      "Experince": widget.experience,
      "Employees": widget.employee,
      "Company Start Year": widget.startYear,
      "More About the Company": _more.text,
    };
    return body;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return Stack(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 335.w,
            height: 120.h,
            child: DottedBorder(
              strokeWidth: 1.sp,
              color: kDullMainColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_rounded,
                      color: kMainColor,
                      size: 37.sp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    NormalText(
                      text: 'Add your profile image',
                      size: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          SizedBox(
            height: 300.h,
            child: TextField(
              controller: _more,
              textAlignVertical: TextAlignVertical.top,
              expands: true,
              maxLength: 150,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'More about your business',
                hintStyle: TextStyle(color: kBlackDull, fontSize: 16.sp),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kMainColor, width: 1.0.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kMainColor, width: 1.0.w),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
                ),
                labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ReuseableButton(
              text: 'Submit',
              onPressed: () async {
                authViewModel.setLoading(true);
                String? response =
                    await authViewModel.signUpCraftMen(body: _getInputedData(), context: context);
                if (response == 'Success') {
                  authViewModel.setLoading(false);
                  dialogBuilder(
                      context,
                      'lib/assets/verifiedIcon.png',
                      'Thank You',
                      'Thanks for taking your time to fill the details. Once your service is needed, you will be notify  ',
                      'View Details', () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            OnBoardingScreen(user: widget.user),
                      ),
                    );
                  });
                } else {
                  authViewModel.setLoading(false);
                  ShowSnackBar.buildErrorSnackbar(
                      context,
                      'Something went wrong, please try again later',
                      Colors.red);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OnBoardingScreen(user: widget.user),
                    ),
                  );
                }
              }),
        ]),
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
    );
  }
}
