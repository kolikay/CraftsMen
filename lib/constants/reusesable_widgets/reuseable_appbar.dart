import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ReuseableAppbar extends StatefulWidget {
  final GestureTapCallback firstButton;
  final GestureTapCallback secondButton;
  final String appBarTitle;
  final IconData firstAppIcon;
  final IconData? secondAppIcon;
  final Color color;
  const ReuseableAppbar({
    Key? key,
    required this.firstButton,
    required this.secondButton,
    this.appBarTitle = '',
    required this.firstAppIcon,
     this.secondAppIcon,
    required this.color
  }) : super(key: key);

  @override
  State<ReuseableAppbar> createState() => _ReuseableAppbarState();
}

class _ReuseableAppbarState extends State<ReuseableAppbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.firstButton,
            child: Icon(
              widget.firstAppIcon,
              size: 20.0.h,
              color: widget.color,
            ),
          ),
          NormalText(
            text: widget.appBarTitle,
            color: Colors.white,
            size: 24.2.sp,
          ),
          GestureDetector(
      
            child:
                Icon(widget.secondAppIcon, size: 20.0.h, color: widget.color),
          ),
        ],
      ),
    );
  }
}
