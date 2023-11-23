// import 'package:flutter/material.dart';
// import 'package:scholars_padi/constants/appColor.dart';
// import '../models/notification_model.dart';

// class NotificationViewModel extends ChangeNotifier {
//   List<NotificationCardsModel> noticeCard = [
//     NotificationCardsModel(
//         borderColor: AppColor.mainColor,
//         cardColor: const Color(0xffe1ccff),
//         cardMessage:
//             'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
//         cardDate: '18/08/2022',
//         cardTime: '11:05pm',
//         cardTitle: 'OAU management shutdown school'),
//     NotificationCardsModel(
//         borderColor: AppColor.mainColor,
//         cardColor: const Color(0xffe1ccff),
//         cardMessage:
//             'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
//         cardDate: '18/08/2022',
//         cardTime: '11:05pm',
//         cardTitle: 'new messges'),
//     NotificationCardsModel(
//         borderColor: AppColor.mainColor,
//         cardColor: const Color(0xffe1ccff),
//         cardMessage:
//             'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
//         cardDate: '18/08/2022',
//         cardTime: '11:05pm',
//         cardTitle: 'OAU management shutdown school'),
//     NotificationCardsModel(
//         borderColor: AppColor.mainColor,
//         cardColor: const Color(0xffe1ccff),
//         cardMessage:
//             'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
//         cardDate: '18/08/2022',
//         cardTime: '11:05pm',
//         cardTitle: 'OAU management shutdown school'),
//     NotificationCardsModel(
//         borderColor: AppColor.mainColor,
//         cardColor: const Color(0xffe1ccff),
//         cardMessage:
//             'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
//         cardDate: '18/08/2022',
//         cardTime: '11:05pm',
//         cardTitle: 'new messges'),
//     NotificationCardsModel(
//         borderColor: AppColor.mainColor,
//         cardColor: const Color(0xffe1ccff),
//         cardMessage:
//             'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
//         cardDate: '18/08/2022',
//         cardTime: '11:05pm',
//         cardTitle: 'OAU management shutdown school'),
//   ];
//   List<NotificationCardsModel> selectedList = [];

//   void addtoSelectedCardsList(NotificationCardsModel cards) {
//     selectedList.add(cards);
//     notifyListeners();
//   }

//   void deleteFromSelectedCardsList(NotificationCardsModel cards) {
//     selectedList.remove(cards);
//     notifyListeners();
//   }

//   void deleteFromNoticeCardsList(NotificationCardsModel cards) {
//     noticeCard.remove(cards);
//     notifyListeners();
//   }

//   void updateCardColor() {
//     for (int i = 0; i < selectedList.length; i++) {
//       if (selectedList[i].cardColor == const Color(0xffe1ccff)) {
//         selectedList[i].cardColor = Colors.white;
//       } else if (selectedList[i].cardColor == Colors.white) {
//         selectedList[i].cardColor = const Color(0xffe1ccff);
//       }
//     }

//     notifyListeners();
//   }
// }
