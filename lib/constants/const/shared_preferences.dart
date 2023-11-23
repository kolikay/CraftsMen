import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const keyInitialized = 'init'; //initialize bool for shared pref

//initialize shared pref package
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

//set bool key from funtion to true or false (shows if shared pref has initialize explorescreen)
  static Future setInitialized(bool initialized) async =>
      await _preferences!.setBool(keyInitialized, initialized);

// get key function
  static bool? getInitialized() => _preferences!.getBool(keyInitialized);

  //set userType
  Future setUserType(String userType) async =>
      await _preferences!.setString('User Type', userType);
  // get userType
  static String? getUserType() => _preferences!.getString('User Type');




  //set userlocation
  static Future setUserLocation(String location) async =>
      await _preferences!.setString('location', location);

  // get  userlocation
  static String? getUserLocation() => _preferences!.getString('location');



  //set userlatitute
  static Future setUserLat(double latitute) async =>
      await _preferences!.setDouble('latitute', latitute);

  // get userlatitute
  static double? getUserLat() => _preferences!.getDouble('latitute');

  //set userlongitude
  static Future setUserLon(double longitude) async =>
      await _preferences!.setDouble('longitude', longitude);

  // get userlongitude
  static double? getUserLon() => _preferences!.getDouble('longitude');













///////////////////////////////////////////////////////////////////////////////////
  //set usertoken
  Future setLoginUerToken(String token) async =>
      await _preferences!.setString('token', token);
  // get token
  static String? getToken() => _preferences!.getString('token');

  //set usertoken
  static Future setUerRefreshToken(String refreshToken) async =>
      await _preferences!.setString('refreshToken', refreshToken);
  // get token
  static String? getUerRefreshToken() =>
      _preferences!.getString('refreshToken');

  //set userpic
  static Future setUserProfilePix(String token) async =>
      await _preferences!.setString('profilePic', token);

  // get pic
  static String? getUserProfilePix() => _preferences!.getString('profilePic');

  //set usertoken
  static Future setUsername(String username) async =>
      await _preferences!.setString('username', username);

  // get token
  static String? getUsername() => _preferences!.getString('username');

  static resetSharedPref() => _preferences!.clear();
}
