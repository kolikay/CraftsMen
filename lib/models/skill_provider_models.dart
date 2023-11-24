import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SkillProviderModel extends ChangeNotifier {
  SkillProviderModel({
    this.id,
    this.email,
    this.fullName,
    this.userName,
    this.phoneNumber,
    this.gender,
    this.address,
    this.reviews,
    this.profilePic,
    this.userType,
    this.skill,
    this.startYear,
    this.employee,
    this.experience,
    this.companyAdd,
    this.companyName,
    this.compEmail,
    this.companyPhoneNumber,
    this.companyWebsite,
    this.moreAboutMe,
    this.longitude,
    this.latitute,
  });

  String? id;
  String? email;
  String? fullName;
  String? userName;
  String? phoneNumber;
  String? gender;
  String? address;
  String? profilePic;
  List? reviews;
  String? userType;
  String? skill;
  String? startYear;
  int? employee;
  int? experience;
  String? companyName;
  String? companyAdd;
  String? companyPhoneNumber;
  String? companyWebsite;
  String? compEmail;
  String? moreAboutMe;
  double? latitute;
  double? longitude;

  static SkillProviderModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    var snapShot = snap.data();
    return SkillProviderModel(
      id: snapShot!["ID"],
      email: snapShot["email"],
      fullName: snapShot["Full Name"],
      userName: snapShot["User Name"],
      phoneNumber: snapShot["Phone Number"],
      gender: snapShot["Gender"],
      address: snapShot["Address"],
      reviews: ["Reviews"],
      profilePic: snapShot["Profile Pic"],
      userType: snapShot["User Type"],
      companyAdd: snapShot["Company Address"],
      companyName: snapShot["Company Name"],
      compEmail: snapShot["Company Email"],
      companyWebsite: snapShot["Company Website"],
      companyPhoneNumber: snapShot["Company Phone Number"],
      skill: snapShot["Skill"],
      experience: snapShot["Experince"],
      employee: snapShot["Employees"],
      startYear: snapShot["Company Start Year"],
      moreAboutMe: snapShot["More About the Company"],
       latitute: snapShot['Latitute'],
      longitude: snapShot['Longitude'],
    );
  }

  // static SkillProviderModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
  //   var snapShot = snap.data()  ;

  //   return SkillProviderModel(
  //     id: snapShot!["ID"],
  //     email: snapShot["email"],
  //     fullName: snapShot["Full Name"],
  //     userName: snapShot["User Name"],
  //     phoneNumber: snapShot["Phone Number"],
  //     gender: snapShot["Gender"],
  //     address: snapShot["Address"],
  //     reviews: ["Reviews"],
  //     profilePic: snapShot["Profile Pic"],
  //     userType: snapShot["User Type"],
  //     companyAdd: snapShot["Company Address"],
  //     companyName: snapShot["Company Name"],
  //     compEmail: snapShot["Company Email"],
  //     companyWebsite: snapShot["Company Website"],
  //     companyPhoneNumber: snapShot["Company Phone Number"],
  //     skill: snapShot["Skill"],
  //     experience: snapShot["Experince"],
  //     employee: snapShot["Employees"],
  //     startYear: snapShot["Company Start Year"],
  //     moreAboutMe: snapShot["More About the Company"],
  //   );
  // }

  // static SkillProviderModel fromMap(Map<String, dynamic> snapShot) {
  //   return SkillProviderModel(
  //     email: snapShot["email"],
  //     fullName: snapShot["Full Name"],
  //     userName: snapShot["User Name"],
  //     phoneNumber: snapShot["Phone Number"],
  //     gender: snapShot["Gender"],
  //     address: snapShot["Address"],
  //     reviews: ["Reviews"],
  //     profilePic: snapShot["Profile Pic"],
  //     userType: snapShot["User Type"],
  //     companyAdd: snapShot["Company Address"],
  //     companyName: snapShot["Company Name"],
  //     compEmail: snapShot["Company Email"],
  //     companyWebsite: snapShot["Company Website"],
  //     companyPhoneNumber: snapShot["Company Phone Number"],
  //     skill: snapShot["Skill"],
  //     experience: snapShot["Experince"],
  //     employee: snapShot["Employees"],
  //     startYear: snapShot["Company Start Year"],
  //     moreAboutMe: snapShot["More About the Company"],
  //   );
  // }
}
