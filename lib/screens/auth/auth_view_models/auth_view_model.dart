// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/skill_provider_models.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/providers/skill_provider.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:craftsmen/screens/landing_page/no_internet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:auth_handler/auth_handler.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class AuthViewModel extends ChangeNotifier {
  final userPref = UserPreferences();

  static final AuthViewModel _instance = AuthViewModel._();

  AuthViewModel._();

  static AuthViewModel get instance {
    return _instance;
  }

  bool _loading = false;
  bool get loading => _loading;

  bool _loginError = false;
  bool get loginError => _loginError;

  // firebase ref
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  AuthHandler authHandler = AuthHandler();

  UserModel? _user;
  UserModel userApiData = UserModel();
  UserModel get getUser => _user!;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoginError(bool loginError) {
    _loginError = loginError;
    notifyListeners();
  }

  //sent OTP for email validation
  Future sendOtp(String email, context) async {
    setLoading(true);
    authHandler.config(
      senderEmail: "noreply@craftmen.dev",
      senderName: "Crafts Men",
      otpLength: 4,
    );

    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

    if (isConnected) {
      bool result = await authHandler.sendOtp(email);
      if (result) {
        setLoading(false);
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } else {
      Navigator.pushNamed(context, NoInternetScreen.id);
    }
  }




//email validation
  Future verify(String userOtp, context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      setLoading(true);
      bool validated = await authHandler.verifyOtp(userOtp);
      if (validated == true) {
        setLoading(false);
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } else {
      Navigator.pushNamed(context, NoInternetScreen.id);
    }
  }



// User Registration
  Future<String?> signUpUser({
    required Map<String, dynamic> body,
    required String password,
    required String email,
    required String userType,
    required context,
  }) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    setLoading(true);
    if (isConnected) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // do whatever you want to do with new user object
        _firestore.collection(userType).doc(_auth.currentUser!.email).set(body);

        if (userType == "Users") {
          await UserProvider.instance.getLoggedinUserDetails();
        }
        if (userType == "Skill Providers") {
          await SkillProvider.instance.getSKillLoggedinUserDetails();
        }

        setLoading(false);
        return 'Success';
      } on FirebaseAuthException catch (e) {
        setLoading(false);
        return e.toString();
      }
    } else {
      Navigator.pushNamed(context, NoInternetScreen.id);
    }
    return null;
  }



// Craftmen details Registration update
  Future<String?> signUpCraftMen(
      {required Map<String, dynamic> body, context}) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      setLoading(true);
      try {
        await _firestore
            .collection('Skill Providers')
            .doc(_auth.currentUser!.email)
            .update(body);
        setLoading(false);
        return 'Success';
      } on FirebaseAuthException catch (e) {
        setLoading(false);
        return e.toString();
      }
    } else {
      Navigator.pushNamed(context, NoInternetScreen.id);
    }
      return null;
  }

// User Login
  Future<String> signIn(
      {required String password,
      required String email,
      required context}) async {
    String? response;
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      setLoading(true);

      if (password.isNotEmpty || email.isNotEmpty) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          final userDoc = await _firestore
              .collection('Users')
              .doc(_auth.currentUser!.email)
              .get();

          if (userDoc.exists) {
            UserModel data =
                await UserProvider.instance.getLoggedinUserDetails();

            response = data.userType;

            userPref.setUserType('Users');
            setLoading(false);
          } else {
            SkillProviderModel data =
                await SkillProvider.instance.getSKillLoggedinUserDetails();

            response = data.userType;

            userPref.setUserType('Skill Providers');

            setLoading(false);
          }
        }).catchError((e) async {
          await _auth.signOut();
          response = 'Login Failed';
          setLoginError(true);
          setLoading(false);
        });
      }
    } else {
      Navigator.pushNamed(context, NoInternetScreen.id);
    }
    return response!;
  }

  Future logOut(context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      setLoading(true);

      await UserProvider.instance.clearUserDetailsLocally();

      await SkillProvider.instance.clearUserDetailsLocally();

      await UserPreferences.resetSharedPref();

      await _auth.signOut();

      setLoading(false);
    } else {
      Navigator.pushNamed(context, NoInternetScreen.id);
    }
  }

  Future<bool> checkInternet() async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      return true;
    }
    return false;
  }
}
