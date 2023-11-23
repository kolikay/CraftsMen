import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage2 extends StatefulWidget {
  final Function webSiteCont;
  final Function startYear;
  final Function skill;
  final Function employee;
  final Function experience;
  const DetailsPage2(
      {Key? key,
      required this.webSiteCont,
      required this.startYear,
      required this.skill,
      required this.employee,
      required this.experience})
      : super(key: key);

  @override
  State<DetailsPage2> createState() => _DetailsPage2State();
}

class _DetailsPage2State extends State<DetailsPage2> {
  int employee = 0;
  int experince = 0;
  String? proffession;

  final othersCont = TextEditingController();

  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;
  bool? _isChecked4 = false;
  bool? _isChecked5 = false;
  bool? _isChecked6 = false;
  bool? _isChecked7 = false;
  bool? _isChecked8 = false;
  bool? _isChecked9 = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            NormalText(
              text: 'Personal website link (Optional)',
              size: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
            SizedBox(
              height: 5.h,
            ),
            MyTextField(
                onChanged: (val) {
                  widget.webSiteCont(val);
                },
                borderColor: Colors.grey,
                isPassword: false,
                obcureText: false,
                isReadOnly: false,
                labelText: 'Enter Personal Website Link',
                keyBoardType: TextInputType.text),
            SizedBox(
              height: 30.h,
            ),
            NormalText(
              text: 'Number of Employees working for you',
              size: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (employee > 0) {
                      setState(() {
                        employee--;
                         widget.employee(employee);
                      });
                    } else {
                      setState(() {
                        employee = 0;
                      });
                    }
                   
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kDullMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Icon(
                        Icons.minimize_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: kWhite,
                  ),
                  width: 60,
                  height: 50,
                  child: Center(
                    child: NormalText(
                      text: employee.toString(),
                      size: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      employee++;
                       widget.employee(employee);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.add,
                      color: kWhite,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            NormalText(
              text: 'Years of Experience',
              size: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (experince > 0) {
                      setState(() {
                        experince--;
                        widget.experience(experince);
                      });
                    } else {
                      setState(() {
                        experince = 0;
                      });
                    }
                  
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kDullMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Icon(
                        Icons.minimize_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: kWhite,
                  ),
                  width: 60,
                  height: 50,
                  child: Center(
                    child: NormalText(
                      text: experince.toString(),
                      size: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      experince++;
                       widget.experience(experince);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: kMainColor,
                    ),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.add,
                      color: kWhite,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            NormalText(
              text: 'Year of Starting Business',
              size: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
            SizedBox(
              height: 5.h,
            ),
            MyTextField(
                onChanged: (val) {
                  widget.startYear(val);
                },
                borderColor: Colors.grey,
                isPassword: false,
                obcureText: false,
                isReadOnly: false,
                labelText: 'Enter year you started your profession',
                keyBoardType: TextInputType.text),
            SizedBox(
              height: 15.h,
            ),
            NormalText(
              text: 'Profession Category',
              size: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                bottomSheet(context, widget.skill);
              },
              child: Container(
                width: 335.w,
                height: 48.h,
                decoration: BoxDecoration(
                  border: Border.all(color: kBlackDull),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(
                        text: proffession ?? 'Select your Profession category ',
                        color: kBlack,
                        size: 15,
                      ),
                      // SizedBox(height:150, width:100,child: TextField(controller: dateInput,)),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: kMainColor,
                        size: 25.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ],
    );
  }

  bottomSheet(BuildContext context, Function skill) {
    return showModalBottomSheet(
        enableDrag: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        // isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return SingleChildScrollView(
              child: Container(
                height: 1050,
                padding: EdgeInsets.all(20.w),
                decoration: const BoxDecoration(
                  color: kDarkContainer,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 5,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NormalText(
                      text: 'Choose your Profession Category',
                      color: kMainColor,
                      size: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Barbers',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked1,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = check;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            _isChecked5 = false;
                            _isChecked6 = false;
                            _isChecked7 = false;
                            _isChecked8 = false;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Barbers';
                            skill('barbers');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Teachers',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked2,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = check;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            _isChecked5 = false;
                            _isChecked6 = false;
                            _isChecked7 = false;
                            _isChecked8 = false;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Tearchers';
                            skill('teachers');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Electricians',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked3,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = check;
                            _isChecked4 = false;
                            _isChecked5 = false;
                            _isChecked6 = false;
                            _isChecked7 = false;
                            _isChecked8 = false;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Electricians';
                            skill('electricans');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Bakers',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked4,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = check;
                            _isChecked5 = false;
                            _isChecked6 = false;
                            _isChecked7 = false;
                            _isChecked8 = false;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Bakers';
                            skill('bakers');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Plumbers',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked5,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            _isChecked5 = check;
                            _isChecked6 = false;
                            _isChecked7 = false;
                            _isChecked8 = false;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Plumbers';
                            skill('plumbers');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Catering & Food Service',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked6,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            _isChecked5 = false;
                            _isChecked6 = check;
                            _isChecked7 = false;
                            _isChecked8 = false;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Catering & Food Service';
                            skill('foodservices');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Engineers',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked7,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            _isChecked5 = false;
                            _isChecked6 = false;
                            _isChecked7 = check;
                            _isChecked8 = false;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Engineers';
                            skill('engineers');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Doctors',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked8,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            _isChecked5 = false;
                            _isChecked6 = false;
                            _isChecked7 = false;
                            _isChecked8 = check;
                            _isChecked9 = false;
                          });
                          setState(() {
                            proffession = 'Doctors';
                            skill('doctors');
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    items(
                      'Others',
                      Checkbox(
                        checkColor: kMainColor,
                        value: _isChecked9,
                        onChanged: (check) {
                          setModalState(() {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            _isChecked5 = false;
                            _isChecked6 = false;
                            _isChecked7 = false;
                            _isChecked8 = false;
                            _isChecked9 = check;
                            visible = !visible;
                          });
                          setState(() {
                            proffession = 'Others';
                            skill(othersCont.text.toLowerCase().trim());
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: visible,
                      child: MyTextField(
                        controller: othersCont,
                        isPassword: false,
                        isReadOnly: false,
                        keyBoardType: TextInputType.text,
                        labelText: 'Enter other Professions',
                        obcureText: false,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: NormalText(
                            text: 'CANCEL',
                            color: kMainColor,
                            size: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: NormalText(
                            text: 'OK',
                            color: kMainColor,
                            size: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
            ;
          });
        });
  }

  Widget items(String name, Widget check) {
    return Column(
      children: [
        Row(
          children: [
            check,
            NormalText(
              text: name,
              size: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        Container(
          width: 325,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
