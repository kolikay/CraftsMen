import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftsMenBookings extends StatefulWidget {
  const CraftsMenBookings({Key? key}) : super(key: key);

  @override
  State<CraftsMenBookings> createState() => _CraftsMenBookingsState();
}

class _CraftsMenBookingsState extends State<CraftsMenBookings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhite,
          title: NormalText(
            text: 'My Bookings',
            color: kMainColor,
            size: 20.sp,
            fontWeight: FontWeight.w500,
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              NormalText(
                text: 'All',
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              NormalText(
                text: 'Active',
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              NormalText(
                text: 'Completed',
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              NormalText(
                text: 'Cancelled',
                size: 14,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
        body: SizedBox(
          height: 812.h,
          width: 375.w,
          child: TabBarView(children: [
            MyTabView(
              tab: tabs,
            ),
            MyTabView(
              tab: tabs,
            ),
            MyTabView(
              tab: tabs,
            ),
            MyTabView(
              tab: tabs,
            ),
          ]),
        ),
      ),
    ));
  }
}

List<Widget> tabs = const [
  BookingsCards(),
  BookingsCards(),
  BookingsCards(),
];

class MyTabView extends StatefulWidget {
  
  final List<Widget> tab;

  const MyTabView({Key? key, required this.tab}) : super(key: key);

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 375.w,
          height: 812.h,
          child: Column(
            children: widget.tab,
          ),
        ),
      ),
    );
  }
}

class BookingsCards extends StatelessWidget {
  const BookingsCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 335.w,
        height: 220.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: kBlackDull,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NormalText(
                    text: 'Require Electricity service',
                    color: kMainColor,
                    size: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('lib/assets/logoTrans.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 70.h,
                    width: 200.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          text: 'Ali Muhammed',
                          color: kBlackDull,
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        NormalText(
                          text: '4.5',
                          color: kBlackDull,
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        NormalText(
                          text: 'August 8th 2023, 8.20pm',
                          color: kBlackDull,
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NormalText(
                    text: 'Booking ID: 43452',
                    color: kBlackDull,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  NormalText(
                    text: 'completed',
                    color: Colors.green[500],
                    size: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ReuseableButton(
                text: 'View Details',
                onPressed: () {},
                width: 160.w,
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}


// FirebaseFirestore.instance.collection('users').doc(email).set((){
//    "email":email,
//    "pass":pass,
//    "nick":nick,//You can add more fields or remove them
// });