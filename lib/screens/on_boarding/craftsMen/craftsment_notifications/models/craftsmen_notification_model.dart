import 'package:flutter/material.dart';

class CraftsMenNotificationCardsModel {
  final String cardMessage;
  final String cardTitle;
  final String cardDate;
  final String cardTime;
  Color cardColor;
  Color borderColor;

  CraftsMenNotificationCardsModel({
    Key? key,
    required this.cardMessage,
    required this.cardDate,
    required this.cardTime,
    required this.cardTitle,
    required this.cardColor,
    required this.borderColor,
  });
}


// ignore_for_file: file_names

// class Item {
//  final String imageUrl;
//  final int rank;

//   Item({required this.imageUrl, this.rank = 0});

//   // void toggle() {
//   //   selected = !selected;
//   // }
// }
