import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/details/detail_screen1.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/details/details_screen2.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/details/details_screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CraftmenFillDetailsScreen extends ConsumerStatefulWidget {
  final String? user;

 const CraftmenFillDetailsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  // static const String id = 'sign_up_screen';

  @override
  ConsumerState<CraftmenFillDetailsScreen> createState() =>
      _CraftmenFillDetailsScreenState();
}

class _CraftmenFillDetailsScreenState
    extends ConsumerState<CraftmenFillDetailsScreen> {
  late PageController pageController;
  int currentPage = 0;
  bool isLastPage = false;
  String compName = '';
  String compPhone = '';
  String compEmail = '';
  String compAdd = '';
  String webSiteCont = '';
  String startYear = '';
  String skill = '';
  int employee = 0;
  int experience = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: currentPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void _saveCraftEmailDetails(String email) {
    setState(() {
      compEmail = email;
    });
  }

  void _saveCraftPhoneDetails(String phone) {
    setState(() {
      compPhone = phone;
    });
  
  }

  void _saveCraftNameDetails(String name) {
    setState(() {
      compName = name;
    });
  }

  void _saveCraftAddDetails(String add) {
    setState(() {
      compAdd = add;
    });
  }

  void _saveCraftWebsite(String val) {
    setState(() {
      webSiteCont = val;
    });
  }

  void _saveCraftstartYear(String add) {
    setState(() {
      startYear = add;
    });
  }

  void _saveCraftskill(String val) {
    setState(() {
      skill = val;
    });
  }

  void _saveCraftExperience(int val) {
    setState(() {
      experience = val;
    });
  }

  void _saveCraftEmployeee(int val) {
    setState(() {
      employee = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                            dotWidth: 60.w,
                            dotHeight: 3.h,
                            activeDotColor: kMainColor,
                            dotColor: kDullMainColor),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 800,
                        child: PageView(
                          controller: pageController,
                          // onPageChanged: (index) {
                          //   setState(() {
                          //     isLastPage = index == 2;
                          //   });
                          // },
                          children: [
                            DetailsPage1(
                              saveCraftPhoneDetails: _saveCraftPhoneDetails,
                              saveCraftAddDetails: _saveCraftAddDetails,
                              saveCraftEmailDetails: _saveCraftEmailDetails,
                              saveCraftNameDetails: _saveCraftNameDetails,
                            ),
                            DetailsPage2(
                              startYear: _saveCraftstartYear,
                              skill: _saveCraftskill,
                              employee: _saveCraftEmployeee,
                              experience: _saveCraftExperience,
                              webSiteCont: _saveCraftWebsite,
                            ),
                            DetailsPage3(
                              user: widget.user,
                              skill: skill,
                              startYear: startYear,
                              compAdd: compAdd,
                              compEmail: compEmail,
                              compName: compName,
                              employee: employee,
                              experience: experience,
                              webSiteCont: webSiteCont,
                              compPhone: compPhone,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
