import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/models/skillProvider_models.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:image_picker/image_picker.dart';

class SkillProvider extends ChangeNotifier {
  static final SkillProvider _instance = SkillProvider._();

  SkillProvider._();

  static SkillProvider get instance {
    return _instance;
  }

  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final geo = Geoflutterfire();

  //instance of usermodel
  SkillProviderModel skillUserApiData = SkillProviderModel();

  //Get Loggen In User Details
  Future<SkillProviderModel> getSKillLoggedinUserDetails() async {
    User currentUser = _auth.currentUser!;
    final snap = await _firestore
        .collection('Skill Providers')
        .doc(currentUser.email)
        .get();

    // final userData =
    //     snap.docs.map((e) => SkillProviderModel.fromSnapshotNew(e)).single;

    SkillProviderModel skillUser = SkillProviderModel.fromSnapshot(snap);
    skillUserApiData.fullName = skillUser.fullName;
    skillUserApiData.email = skillUser.email;
    skillUserApiData.userName = skillUser.userName;
    skillUserApiData.gender = skillUser.gender;
    skillUserApiData.address = skillUser.address;
    skillUserApiData.phoneNumber = skillUser.phoneNumber;
    skillUserApiData.reviews = skillUser.reviews;
    skillUserApiData.profilePic = skillUser.profilePic;
    skillUserApiData.userType = skillUser.userType;
    skillUserApiData.compEmail = skillUser.compEmail;
    skillUserApiData.companyAdd = skillUser.companyAdd;
    skillUserApiData.companyName = skillUser.companyName;
    skillUserApiData.companyPhoneNumber = skillUser.companyPhoneNumber;
    skillUserApiData.companyWebsite = skillUser.companyWebsite;
    skillUserApiData.skill = skillUser.skill;
    skillUserApiData.startYear = skillUser.startYear;
    skillUserApiData.companyWebsite = skillUser.companyWebsite;
    skillUserApiData.employee = skillUser.employee;
    skillUserApiData.experience = skillUser.experience;
    skillUserApiData.moreAboutMe = skillUser.moreAboutMe;
    skillUserApiData.latitute = skillUserApiData.latitute;
    skillUserApiData.longitude = skillUserApiData.longitude;

    notifyListeners();
    return skillUser;
  }

  //update user
  Future clearUserDetailsLocally() async {
    skillUserApiData.fullName = '';
    skillUserApiData.email = '';
    skillUserApiData.userName = '';
    skillUserApiData.gender = '';
    skillUserApiData.address = '';
    skillUserApiData.phoneNumber = '';
    skillUserApiData.reviews = [];
    skillUserApiData.profilePic = '';
    skillUserApiData.compEmail = '';
    skillUserApiData.companyAdd = '';
    skillUserApiData.companyName = '';
    skillUserApiData.companyPhoneNumber = '';
    skillUserApiData.companyWebsite = '';
    skillUserApiData.skill = '';
    skillUserApiData.startYear = '';
    skillUserApiData.companyWebsite = '';
    skillUserApiData.employee = 0;
    skillUserApiData.experience = 0;
    skillUserApiData.moreAboutMe = '';
    skillUserApiData.latitute = 0.0;
    skillUserApiData.longitude = 0.0;
    notifyListeners();
  }

  // Update Login User Details
  Future updateLoggedinUserDetails(Map<String, dynamic> body) async {
    User currentUser = _auth.currentUser!;
    await _firestore
        .collection('Skill Providers')
        .doc(currentUser.email)
        .update(body);
    await getSKillLoggedinUserDetails();
  }

  // Update Login User locations
  Future updateLoggedinUserLocations(String userType) async {
    try {
      double? latitute = UserPreferences.getUserLat();
      double? longitude = UserPreferences.getUserLon();
      String? address = UserPreferences.getUserLocation();

      print(latitute);
      print(address);

      GeoFirePoint myPosition =
          geo.point(latitude: latitute!, longitude: longitude!);
      print(myPosition);

      await _firestore
          .collection('Skill Providers')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .update({
        'Address': address,
        'Latitute': latitute,
        'Longitude': longitude,
        'position': myPosition.data,
      });
      await getSKillLoggedinUserDetails();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> updateUserPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }
}
