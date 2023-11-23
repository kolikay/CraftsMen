// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class NotificationMaterialCards extends ConsumerStatefulWidget {
//   final String cardMessage;
//   final String cardTitle;
//   final String cardDate;
//   final String cardTime;
//   final Color borderColor;
//  final Color cardColor ;
//   final ValueChanged<bool> isSelected;

//   const NotificationMaterialCards({
//     Key? key,
//     required this.cardMessage,
//     required this.cardDate,
//     required this.cardTime,
//     required this.cardTitle,
//     required this.isSelected,
//    required this.borderColor,
//     required this.cardColor,
//   }) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _NotificationMaterialCardsState();
// }

// class _NotificationMaterialCardsState
//     extends ConsumerState<NotificationMaterialCards> {
//   // to toggle card based on if it is selected or not
//   bool selected = false;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // change slected state to true and false
//         selected = !selected;

//         //notify parent widget of change in selected state
//         widget.isSelected(selected);
//       },
//       child: Container(
//         width: 327.w,
//         height: 145.h,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5.53.w),
//             border: !selected
//                 ? Border.all(
//                     color: Colors.black12,
//                   )
//                 : Border.all(
//                     color: AppColor.mainColor,
//                     width: 2.0,
//                     style: BorderStyle.solid),
//             color: widget.cardColor),
//         child: Padding(
//           padding: EdgeInsets.all(10.0.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: 222.w,
//                     height: 45.h,
//                     child: NormalText(
//                       text: widget.cardTitle,
//                       size: 14.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   NormalText(
//                     text: widget.cardDate,
//                     size: 12.sp,
//                     color: AppColor.dullerBlack,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 58.h,
//                 width: 327.w,
//                 child: NormalText(
//                   text: widget.cardMessage,
//                   size: 12.sp,
//                   color: AppColor.dullBlack,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: 100.w,
//                   ),
//                   NormalText(
//                     text: widget.cardDate,
//                     size: 11.sp,
//                     color: AppColor.dullerBlack,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
