// ignore_for_file: use_build_context_synchronously

import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:craftsmen/screens/on_boarding/user/home_screens/categories_page.dart';
import 'package:craftsmen/screens/search/display_allsearch_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'homepage_constant_widgets.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  static const String id = 'homepage_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  final searchCont = TextEditingController();
  TextEditingController location = TextEditingController();
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    addData();
    _getCurrentPosition();
  }

  addData() async {
    await UserProvider.instance.getLoggedinUserDetails();
  }

  String checkSearch(myString) {
    String search = '';
    var output = myString[myString.length - 1];
    if (output != 's') {
      search = "${myString + 's'}".toLowerCase().trim();
    } else if (output == 's') {
      search = myString;
    }
    return search;
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
        location.text =
            '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
        UserPreferences.setUserLocation(location.text);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content:
              Text('Current Location Retried Successfully'),
        ),
      );
    }).catchError((e) {
    e.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final loginUser = ref.watch(userProvider);

    return SafeArea(
      child: Stack(children: [
        Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NormalText(
                          text:
                              "Hello ${loginUser.userApiData.userName ?? ''} !!! ",
                          size: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: kMainColor,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_alert_sharp,
                            color: kMainColor,
                            size: 30.h,
                          ),
                        ),
                      ],
                    ),
                    NormalText(
                      text: location.text,
                      size: 14.sp,
                      color: kBlackDull,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.r),
                        color: kMainColor,
                      ),
                      height: 144.h,
                      width: 355.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          NormalText(
                            text: 'What home service do you need today?',
                            size: 15.sp,
                            color: kWhite,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              color: kWhite,
                              child: TextField(
                                onSubmitted: (val) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          DisplayAllSearchScreen(
                                              service: checkSearch(val))),
                                    ),
                                  );
                                },
                                controller: searchCont,
                                decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              DisplayAllSearchScreen(
                                                  service: checkSearch(
                                                      searchCont.text))),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.search,
                                      color: kBlackDull,
                                      size: 24,
                                    ),
                                  ),
                                  hintText: 'Search For Anything',
                                  hintStyle: TextStyle(
                                      color: kBlackDull, fontSize: 16.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            NormalText(
                              text: 'Services',
                              size: 19.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Container(
                          width: 343.w,
                          height: 176.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0.w, vertical: 12.w),
                            child: GridView.count(
                              primary: false,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                              crossAxisCount: 4,
                              children: <Widget>[
                                HomeConstants.newInkwell(context, 'Plumbers',
                                    'lib/assets/plumber.png', () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DisplayAllSearchScreen(
                                            service: 'plumbers',
                                          )),
                                    ),
                                  );
                                }),
                                HomeConstants.newInkwell(context, 'Painters ',
                                    'lib/assets/painter.png', () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DisplayAllSearchScreen(
                                            service: 'painters',
                                          )),
                                    ),
                                  );
                                }),
                                HomeConstants.newInkwell(
                                    context,
                                    'Electricians',
                                    'lib/assets/electrician.png', () async {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DisplayAllSearchScreen(
                                            service: 'electricians',
                                          )),
                                    ),
                                  );
                                }),
                                HomeConstants.newInkwell(
                                    context, 'Barber', 'lib/assets/barber.png',
                                    () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DisplayAllSearchScreen(
                                            service: 'barbers',
                                          )),
                                    ),
                                  );
                                }),
                                HomeConstants.newInkwell(context, 'Engineer',
                                    'lib/assets/engineer.png', () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DisplayAllSearchScreen(
                                            service: 'engineers',
                                          )),
                                    ),
                                  );
                                }),
                                HomeConstants.newInkwell(
                                    context, 'Doctors', 'lib/assets/health.png',
                                    () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DisplayAllSearchScreen(
                                            service: 'doctors',
                                          )),
                                    ),
                                  );
                                }),
                                HomeConstants.newInkwell(context, 'Carpenter',
                                    'lib/assets/carpenter.png', () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DisplayAllSearchScreen(
                                            service: 'carpenters',
                                          )),
                                    ),
                                  );
                                }),
                                HomeConstants.newInkwell(
                                    context, 'More', 'lib/assets/more.png', () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const CategoriesPage()),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            NormalText(
                              text: 'Check these out',
                              size: 19.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9.w,
                            autoPlay: true,
                            onPageChanged: (index, reason) => setState(
                                () => HomeConstants.activeImageIndex = index),
                            autoPlayInterval: const Duration(seconds: 2),
                          ),
                          itemCount: HomeConstants.images.length,
                          itemBuilder: (context, index, realIndex) {
                            final image = HomeConstants.images[index];
                            return HomeConstants.buildImage(image, index);
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        HomeConstants.buildIndicator(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: authViewModel.loading
              ? const Center(
                  child: ProgressDialog(
                    message: 'Loading....',
                  ),
                )
              : const SizedBox(),
        ),
      ]),
    );
  }
}
