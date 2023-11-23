import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchDisplayCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String distance;
  final String rating;
  final GestureTapCallback tapped;

  const SearchDisplayCard(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.distance,
      required this.rating,
      required this.tapped})
      : super(key: key);

  @override
  State<SearchDisplayCard> createState() => _SearchDisplayCardState();
}

class _SearchDisplayCardState extends State<SearchDisplayCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: widget.tapped,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 95.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(widget.imageUrl),
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
                          text: widget.name,
                          color: kBlack,
                          size: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        NormalText(
                          text: widget.distance,
                          color: kBlackDull,
                          size: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                              size: 14,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            NormalText(
                              text: widget.rating,
                              color: kBlackDull,
                              size: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.w,
                color: kMainColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
