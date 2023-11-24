// ignore_for_file: deprecated_member_use

import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/providers/skill_provider.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/landing_page/no_internet_page2.dart';
import 'package:craftsmen/screens/on_boarding/craftsMen/crafts_home_screens/crafts_home_page.dart';
import 'package:craftsmen/screens/on_boarding/user/notifications/views/notification_screen1.dart';
import 'package:craftsmen/screens/settings/craftsmen_settings_screen.dart';

import 'package:craftsmen/screens/settings/user_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

import 'user/bookings/bookings.dart';
import 'user/home_screens/home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  final String? user;
  static String id = 'onBordingScreen';

  const OnBoardingScreen({Key? key, required this.user}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Position? _currentPosition;
  bool isConnect = true;
  final TextEditingController _location = TextEditingController();

  int currentIndex = 0;
  final userScreens = [
    const HomePageScreen(),
    const Bookings(),
    const NotificationScreen1(),
    const UserSettingsScreen()
  ];

  final userOnboardingIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_add),
      label: 'Bookings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Accounts',
    ),
  ];

  final skillScreens = const [
    Bookings(),
    CraftsHomePageScreen(),
    CraftsHomePageScreen(),
    CraftsMenSettingsScreen()
  ];

  final skillIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_add),
      label: 'Bookings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.reviews_outlined),
      label: 'Reviews',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Accounts',
    ),
  ];

  final bothScreens = const [
    HomePageScreen(),
    HomePageScreen(),
    HomePageScreen(),
    HomePageScreen(),
    Bookings(),
  ];

  final bothIcons = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'bome',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Rome',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Dome',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_add),
      label: 'Bookings',
    ),
  ];

  @override
  void initState() {
    checkInternet();
    _addData();
    super.initState();
  }

  _addData() async {
    await _getCurrentPosition();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    AuthViewModel.instance.setLoading(true);
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);

      UserPreferences.setUserLat(_currentPosition!.latitude);
      UserPreferences.setUserLon(_currentPosition!.longitude);

      _getAddressFromLatLng(_currentPosition!);

      AuthViewModel.instance.setLoading(false);
    }).catchError((e) {
      e.toString();
      AuthViewModel.instance.setLoading(false);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _location.text =
            '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
        UserPreferences.setUserLocation(_location.text);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Current Location Retried Successfully'),
        ),
      );
    }).catchError((e) {
      e.toString();
    });
  }

  Future checkInternet() async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      setState(() {
        isConnect = isConnected;
      });
    } else {
      isConnect = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<StatefulWidget> showScreen = [];
    List<BottomNavigationBarItem> onboardingIcons = [];

    if (widget.user == 'Skill Providers') {
      SkillProvider.instance.getSKillLoggedinUserDetails();
    } else if (widget.user == 'Users') {
      UserProvider.instance.getLoggedinUserDetails();
    }

    switch (widget.user) {
      case 'Skill Providers':
        setState(() {
          showScreen = skillScreens;
          onboardingIcons = skillIcons;
        });
        break;
      case 'Users':
        setState(() {
          showScreen = userScreens;
          onboardingIcons = userOnboardingIcons;
        });
        break;

      // default:
      //   setState(() {
      //     showScreen = bothScreens;
      //     onboardingIcons = bothIcons;
      //   });
    }
    return isConnect
        ? WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: showScreen[currentIndex],
              // body: userScreens[currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                  iconSize: 25.0.w,
                  backgroundColor: Colors.white70,
                  selectedItemColor: kMainColor,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) => setState(() => currentIndex = index),
                  currentIndex: currentIndex,
                  items: onboardingIcons
                  // items: userOnboardingIcons,

                  ),
            ),
          )
        : NoInternetScreen2(
            user: widget.user,
          );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => SizedBox(
            height: 20,
            width: 20,
            child: AlertDialog(
              title: Center(
                child: NormalText(
                  text: 'Are you Sure',
                  size: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              content: NormalText(
                text: 'Do you want to exit the app',
                size: 17.sp,
                fontWeight: FontWeight.w500,
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(false), //<-- SEE HERE
                      child: NormalText(
                        text: 'No',
                        size: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: kMainColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(true), // <-- SEE HERE
                      child: NormalText(
                        text: 'Yes',
                        size: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )) ??
        false;
  }
}
