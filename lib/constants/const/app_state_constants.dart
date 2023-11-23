// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/user_models.dart';
import 'package:craftsmen/providers/search_skills_provider.dart';
import 'package:craftsmen/providers/skill_provider.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/location/location_screen.dart';
import 'package:craftsmen/screens/on_boarding/user/profile_screens/profile_view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



const baseApi = 'https://scholarspadi.com/api';

const googleApikey = 'AIzaSyD8sWntz2nx2hmtohvlGQWGu-9OjnBMGBc';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel.instance;
});

// final profileViewModelProvider =
//     ChangeNotifierProvider<ProfileModelView>((ref) {
//   return ProfileModelView();
// });

//provider for users in user api data
final userProvider = ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider.instance;
});

//provider for skillprovider in user api data
final skillProvider = ChangeNotifierProvider<SkillProvider>((ref) {
  return SkillProvider.instance;
});

final searchProvider = ChangeNotifierProvider((ref) {
  return SearchSkillProvider.instance;
});






// // Update state and notify Notification screen app bar
// final notificationProvider = ChangeNotifierProvider<NotificationViewModel>((ref) {
//   return NotificationViewModel();
// });


