import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeConstants {
  static int activeImageIndex = 0;

  static List<String> images = [
    'lib/assets/homepageAdvert.png',
    'lib/assets/homepageAdvert.png',
    'lib/assets/homepageAdvert.png',
  ];

  static Widget buildImage(String image, int index) {
    return Container(
      height: 176.h,
      width: 355.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }

  static Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeImageIndex,
      count: images.length,
      effect: WormEffect(
          dotWidth: 8.0.w,
          dotHeight: 8.0.h,
          activeDotColor: kBlackDull,
          dotColor: Colors.black12),
    );
  }

  static InkWell newInkwell(BuildContext context, String label, String imgUrl,
      GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ResizeImage(AssetImage(imgUrl), height: 30, width: 30),
                ),
              ),
            ),
            NormalText(
              text: label,
              size: 10.sp,
            ),
          ],
        ),
      ),
    );
  }
    static InkWell categoryCard(BuildContext context, String label, String imgUrl,
      GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            child: SizedBox(
              width: 100.w,
              height: 90.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ResizeImage(AssetImage(imgUrl),
                            height: 30, width: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  NormalText(
                    text: label,
                    size: 10.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerIcons extends StatefulWidget {
  final IconData icon;
  final String imageName;
  final GestureTapCallback? onPressed;
 final Color? iconColor;

 const DrawerIcons(
      {Key? key,
      required this.icon,
      required this.imageName,
      this.onPressed,
      this.iconColor})
      : super(key: key);

  @override
  State<DrawerIcons> createState() => _DrawerIconsState();
}

class _DrawerIconsState extends State<DrawerIcons> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: const Color(0xffC4C4C4),
        splashColor: const Color(0xffC4C4C4),
        onTap: widget.onPressed,
        child: SizedBox(
          height: 46.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  Icon(
                    widget.icon,
                    size: 30.w,
                    color: widget.iconColor,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  NormalText(
                    text: widget.imageName,
                    size: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15.w,
                  color: widget.iconColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
