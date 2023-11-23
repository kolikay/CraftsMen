// import 'package:craftsmen/constants/const/color.dart';
// import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


// class CatergoriesSearchScreen extends StatelessWidget {
//   const CatergoriesSearchScreen({Key? key}) : super(key: key);
//   static const id = 'catsearchscreenresult';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: EdgeInsets.only(top: 20.h, left: 20.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 327.w,
//               height: 50.h,
//               color: kDarkContainer,
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(
//                     Icons.cancel,
//                     size: 25.h,
//                     color: kBlackDull,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     size: 25.h,
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1.0.h),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: kMainColor, width: 1.0.h),
//                   ),
//                 ),
//               ),
//             ),
//           SizedBox(height: 40.h,),
//           NormalText(text: 'Result Search', fontWeight: FontWeight.w500, size: 16,),
//           ],
//         ),
//       ),
//     ));
//   }
// }
