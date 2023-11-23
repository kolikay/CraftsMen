import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/units_converter.dart';

class AboutTabView extends StatefulWidget {
  DocumentSnapshot craftManDetails;
  double distance;
  AboutTabView(
      {Key? key, required this.craftManDetails, required this.distance})
      : super(key: key);

  @override
  State<AboutTabView> createState() => _AboutTabViewState();
}

class _AboutTabViewState extends State<AboutTabView> {
  final _fullnameCont = TextEditingController();
  final _awayFromYouCont = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _yOE = TextEditingController();
  final _started = TextEditingController();
  final _ratings = TextEditingController();
  final _jobCompleted = TextEditingController();
  final _skill = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot detail = widget.craftManDetails;
    _email.text = detail.get('email') ?? '';
    _fullnameCont.text = detail.get('Full Name') ?? '';
    _awayFromYouCont.text =
        '${widget.distance.convertFromTo(LENGTH.meters, LENGTH.kilometers)!.toStringAsFixed(4)} kw away';
    _phone.text = detail.get('Phone Number') ?? '';
    _address.text = detail.get('Address') ?? '';
    _skill.text = detail.get('Skill') ?? '';
    _yOE.text = detail.get('Experince').toString();
    _started.text = detail.get('Company Start Year').toString();
    _ratings.text = '4.5';
    _jobCompleted.text = "47";

    return SingleChildScrollView(
      child: SizedBox(
        width: 375.w,
        height: 700.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Full Name',
              controller: _fullnameCont,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Email',
              controller: _email,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Skill',
              controller: _skill,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Away From You',
              controller: _awayFromYouCont,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Address',
              controller: _address,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Years Of Experience',
              isReadOnly: true,
              controller: _yOE,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Phone Number',
              controller: _phone,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Year Started Business',
              controller: _started,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Ratings',
              controller: _ratings,
              isReadOnly: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileFormField(
              labelText: 'Jobs Completed',
              controller: _jobCompleted,
              isReadOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> tabs = const [
  ReviewCards(),
  ReviewCards(),
  ReviewCards(),
];

class ReviwTabView extends StatefulWidget {
  final List<Widget> tab;
  DocumentSnapshot craftManDetails;

  ReviwTabView({Key? key, required this.tab, required this.craftManDetails})
      : super(key: key);

  @override
  State<ReviwTabView> createState() => _ReviwTabViewState();
}

class _ReviwTabViewState extends State<ReviwTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 375.w,
          height: 800.h,
          child: Column(
            children: widget.tab,
          ),
        ),
      ),
    );
  }
}

class ReviewCards extends StatelessWidget {
  const ReviewCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
                height: 121.h,
                child: Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: 80.w,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('lib/assets/workerImage.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 270.w,
                height: 121.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: NormalText(
                            text: 'iniola David',
                            color: kBlack,
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        NormalText(
                          text: '09/08/2023',
                          color: kBlackDull,
                          size: 14.sp,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color(0xffF3B21A),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color(0xffF3B21A),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color(0xffF3B21A),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: SizedBox(
                        width: 281.w,
                        height: 66.h,
                        child: const Text(
                          "He arrived on time. Very prompt and his work is excellent.He fixed my freezer appropriately with some other appliances faulty",
                          style: TextStyle(
                            color: kBlackDull,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: kBlackDull,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

class WorkPhotoTabView extends StatelessWidget {
  DocumentSnapshot craftManDetails;
  WorkPhotoTabView({Key? key, required this.craftManDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 600.h,
          width: 335.w,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 5,
            mainAxisSpacing: 7,
            crossAxisCount: 3,
            children: <Widget>[
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker1.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker2.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker3.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker4.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker5.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker6.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker7.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker8.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'lib/assets/worker9.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
