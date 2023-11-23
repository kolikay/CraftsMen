// // ignore_for_file: use_full_hex_values_for_flutter_colors

// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import 'package:scholars_padi/constants/app_state_constants.dart';
// import 'package:scholars_padi/routes/page_routes.dart';
// import 'package:scholars_padi/screens/on_boarding/notifications/notifications_view_models/notification_view_model.dart';
// import 'package:scholars_padi/screens/on_boarding/notifications/views/notification_cards.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:scholars_padi/widgets/utils/snack_bar.dart';

// class NotificationScreen extends ConsumerStatefulWidget {
//   const NotificationScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _NotificationScreenState();
// }

// class _NotificationScreenState extends ConsumerState<NotificationScreen> {
//   // bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     final notificationViewModel = ref.watch(notificationProvider);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(103.h),
//         child: getAppBar(notificationViewModel),
//       ),
//       body: ListView.builder(
//         itemCount: notificationViewModel.noticeCard.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               SizedBox(
//                 height: 10.h,
//               ),
//               NotificationMaterialCards(
//                 borderColor:
//                     notificationViewModel.noticeCard[index].borderColor,
//                 cardColor: notificationViewModel.noticeCard[index].cardColor,
//                 cardMessage:
//                     notificationViewModel.noticeCard[index].cardMessage,
//                 cardDate: notificationViewModel.noticeCard[index].cardDate,
//                 cardTime: notificationViewModel.noticeCard[index].cardTime,
//                 cardTitle: notificationViewModel.noticeCard[index].cardTitle,
//                 // receives call back value from child widget and update state
//                 isSelected: (value) {
//                   setState(() {
//                     //select card function

//                     if (value) {
//                       notificationViewModel.addtoSelectedCardsList(
//                           notificationViewModel.noticeCard[index]);
//                     } else {
//                       notificationViewModel.deleteFromSelectedCardsList(
//                           notificationViewModel.noticeCard[index]);
//                     }
//                   });
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   getAppBar(
//     NotificationViewModel notificationViewModel,
//   ) {
//     return notificationViewModel.selectedList.isEmpty
//         ? ReuseableAppBar1(
//             backGroundColor: AppColor.mainColor,
//             title: NormalText(
//               text: 'Notifications',
//               color: Colors.white,
//             ),
//             firstAppIcon: IconButton(
//               onPressed: () {
//                 pushOnBoardingScreen(context);
//               },
//               icon: const Icon(Icons.arrow_back_ios),
//             ),
//             secondAppIcon: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.search),
//             ),
//           )
//         : ReuseableAppBar1(
//             backGroundColor: const Color(0xffbf000001),
//             title: NormalText(
//               text: "${notificationViewModel.selectedList.length} Selected",
//               color: Colors.white,
//             ),
//             firstAppIcon: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.arrow_back_ios),
//             ),
//             secondAppIcon: IconButton(
//               onPressed: () {
//                 notificationViewModel.updateCardColor();
//               },
//               icon: const Icon(
//                 Icons.email_outlined,
//               ),
//             ),
//             thirdAppIcon: IconButton(
//               onPressed: () {
//                 setState(() {
//                   //deleted card function
//                   for (int i = 0;
//                       i < notificationViewModel.selectedList.length;
//                       i++) {
//                     notificationViewModel.deleteFromNoticeCardsList(
//                         notificationViewModel.selectedList[i]);
//                   }
//                   ShowSnackBar.openSnackBar(
//                       context,
//                       "${notificationViewModel.selectedList.length} item Deleted",
//                       'Undo delete',
//                       () {});
//                   notificationViewModel.selectedList = [];
//                 });
//               },
//               icon: const Icon(
//                 Icons.delete,
//               ),
//             ));
//   }
// }
