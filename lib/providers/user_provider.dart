import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';



class UserProvider extends ChangeNotifier {
  static final UserProvider _instance = UserProvider._();

  UserProvider._();

  static UserProvider get instance {
    return _instance;
  }

  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final geo = Geoflutterfire();

  //instance of usermodel
  UserModel userApiData = UserModel();

  //Get Loggen In User Details
  Future<UserModel> getLoggedinUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('Users').doc(currentUser.email).get();

    UserModel user = UserModel.fromSnapshot(snap);
    userApiData.fullName = user.fullName;
    userApiData.email = user.email;
    userApiData.userName = user.userName;
    userApiData.gender = user.gender;
    userApiData.address = user.address;
    userApiData.phoneNumber = user.phoneNumber;
    userApiData.reviews = user.reviews;
    userApiData.profilePic = user.profilePic;
    userApiData.latitute = user.latitute;
    userApiData.longitude = user.longitude;

    notifyListeners();

    return user;
  }

//clear user detail on logout
  Future clearUserDetailsLocally() async {
    userApiData.fullName = '';
    userApiData.email = '';
    userApiData.userName = '';
    userApiData.gender = '';
    userApiData.address = '';
    userApiData.phoneNumber = '';
    userApiData.reviews = [];
    userApiData.profilePic = '';
    userApiData.latitute = 0.0;
    userApiData.longitude = 0.0;
    notifyListeners();
  }

  // Update Login User Details
  Future updateLoggedinUserDetails(Map<String, dynamic> body) async {
    User currentUser = _auth.currentUser!;
    await _firestore.collection('Users').doc(currentUser.email).update(body);
    await getLoggedinUserDetails();
  }

  // Update Login User locations
  Future updateLoggedinUserLocations(String userType) async {
    try {
      double? latitute = UserPreferences.getUserLat();
      double? longitude = UserPreferences.getUserLon();
      String? address = UserPreferences.getUserLocation();

      GeoFirePoint myPosition =
          geo.point(latitude: latitute!, longitude: longitude!);

      User currentUser = _auth.currentUser!;
      await _firestore.collection('Users').doc(currentUser.email).update({
        'Address': address,
        'Latitute': latitute,
        'Longitude': longitude,
        'position': myPosition.data,
      });
      await getLoggedinUserDetails();
    } catch (e) {
      e.toString();
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
