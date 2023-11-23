// // ignore_for_file: use_build_context_synchronously
//
// import 'dart:async';
// import 'dart:ffi';
//
// import 'package:craftsmen/constants/const/color.dart';
// import 'package:craftsmen/constants/const/shared_preferences.dart';
// import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
// import 'package:craftsmen/constants/reusesable_widgets/reuseable_button.dart';
// import 'package:craftsmen/constants/utils/progress_bar.dart';
// import 'package:craftsmen/constants/utils/snack_bar.dart';
// import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
// import 'package:craftsmen/screens/auth/views/verify_otp_screen.dart';
// import 'package:craftsmen/screens/location/location_screen2.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_place/google_place.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../constants/const/app_state_constants.dart';
// import 'package:geoflutterfire/geoflutterfire.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class LocationSearchScreen extends ConsumerStatefulWidget {
//   final String? email;
//   final String? password;
//   String? userType;
//   final Map<String, dynamic>? body;
//   LocationSearchScreen(
//       {Key? key, this.email, this.body, this.password, this.userType})
//       : super(key: key);
//   static const String id = 'location_search_screen';
//
//   @override
//   ConsumerState<LocationSearchScreen> createState() =>
//       _LocationSearchScreenState();
// }
//
// class _LocationSearchScreenState extends ConsumerState<LocationSearchScreen> {
//   final userPref = UserPreferences();
//   late GooglePlace googlePlace;
//   TextEditingController location = TextEditingController();
//   List<AutocompletePrediction> predictions = [];
//   Timer? _debounce;
//
//   DetailsResult? startSearch;
//   late FocusNode startFocusNode;
//   double lat = 0.0;
//   double long = 0.0;
//
//   Position? _currentPosition;
//
//   final geo = Geoflutterfire();
//   final _firestore = FirebaseFirestore.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     // String apiKey = 'AIzaSyD8sWntz2nx2hmtohvlGQWGu-9OjnBMGBc';
//     String apiKey = googleApikey;
//     googlePlace = GooglePlace(apiKey);
//     startFocusNode = FocusNode();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     startFocusNode.dispose();
//   }
//
//   autoCompleteSearch(String value) async {
//     var result = await googlePlace.autocomplete.get(value);
//
//     if (result != null && result.predictions != null && mounted) {
//       setState(() {
//         predictions = result.predictions!;
//       });
//     }
//   }
//
//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Location permissions are denied')));
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location permissions are permanently denied, we cannot request permissions.')));
//       return false;
//     }
//     return true;
//   }
//
//   Future<void> _getCurrentPosition(String userType) async {
//     AuthViewModel.instance.setLoading(true);
//     final hasPermission = await _handleLocationPermission();
//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//
//       GeoFirePoint myPosition = geo.point(
//           latitude: _currentPosition!.latitude,
//           longitude: _currentPosition!.longitude);
//
//       _firestore
//           .collection('Skill Providers')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .update({'position': myPosition.data});
//
//       _getAddressFromLatLng(_currentPosition!);
//
//       AuthViewModel.instance.setLoading(false);
//     }).catchError((e) {
//       debugPrint(e);
//       AuthViewModel.instance.setLoading(false);
//     });
//   }
//
//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//             _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         location.text =
//             '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
//         UserPreferences.setUserLocation(location.text);
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           backgroundColor: Colors.green,
//           content:
//               Text('Address Retrived Successfully, click proceed to continue'),
//         ),
//       );
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = ref.watch(authViewModelProvider);
//
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 100.h,
//                       width: 103.w,
//                       child: Image.asset('lib/assets/logoTrans.png'),
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     NormalText(
//                       text: 'Its Nice to see you again!',
//                       fontWeight: FontWeight.w600,
//                       size: 20.sp,
//                       color: kMainColor,
//                     ),
//                     SizedBox(
//                       height: 150.h,
//                       width: 200.w,
//                       child: Image.asset('lib/assets/locationImage.png'),
//                     ),
//                     Text(
//                       'Add your address to serve you better with various services around you',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: kBlackDull,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     MyTextField(
//                         focus: startFocusNode,
//                         controller: location,
//                         isPassword: false,
//                         obcureText: false,
//                         isReadOnly: false,
//                         labelText: 'Enter Location Address',
//                         keyBoardType: TextInputType.text,
//                         onChanged: (value) {
//                           if (value.isNotEmpty) {
//                             autoCompleteSearch(value);
//                             FocusManager.instance.primaryFocus?.unfocus();
//                           } else {
//                             setState(() {
//                               predictions = [];
//                               startSearch = null;
//                             });
//                           }
//                         },
//                         // if (_debounce?.isActive ?? false) _debounce!.cancel();
//                         //   _debounce =
//                         //       Timer(const Duration(milliseconds: 1000), () {
//
//                         //     if (value.isNotEmpty) {
//                         //       autoCompleteSearch(value);
//                         //       FocusManager.instance.primaryFocus?.unfocus();
//                         //     } else {
//                         //       setState(() {
//                         //         predictions = [];
//                         //         startSearch = null;
//                         //       });
//                         //     }
//                         //   });
//                         // },
//                         sufixIcon: location.text.isNotEmpty
//                             ? IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     predictions = [];
//                                     location.clear();
//                                   });
//                                 },
//                                 icon: const Icon(
//                                   Icons.clear_outlined,
//                                   color: Colors.red,
//                                 ))
//                             : null),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     SizedBox(
//                       height: predictions.length > 3 ? 150 : 5,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: predictions.length,
//                         itemBuilder: ((context, index) {
//                           return ListTile(
//                             leading: const CircleAvatar(
//                               child: Icon(
//                                 Icons.pin_drop,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             title: NormalText(
//                                 text:
//                                     predictions[index].description.toString()),
//                             onTap: () async {
//                               final placeId = predictions[index].placeId!;
//                               final details =
//                                   await googlePlace.details.get(placeId);
//                               if (details != null &&
//                                   details.result != null &&
//                                   mounted) {
//                                 setState(() {
//                                   startSearch = details.result;
//                                   location.text =
//                                       details.result!.formattedAddress!;
//                                   predictions = [];
//                                 });
//                               }
//                             },
//                           );
//                         }),
//                       ),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           _getCurrentPosition('Users');
//                         },
//                         child: NormalText(
//                           text: 'Current Location',
//                           size: 18,
//                           color: kMainColor,
//                           fontWeight: FontWeight.w500,
//                         )),
//
//                     ReuseableButton(
//                         text: "Proceed",
//                         onPressed: () async {
//                           bool sentOtp = await AuthViewModel.instance
//                               .sendOtp(widget.email!, context);
//                           if (sentOtp) {
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => VerifyOtpScreen(
//                                 email: widget.email!,
//                                 password: widget.password!,
//                                 body: widget.body!,
//                                 userType: widget.userType,
//                               ),
//                             ));
//                             ShowSnackBar.buildErrorSnackbar(
//                                 context, 'OTP Sent  ', Colors.greenAccent);
//                           } else {
//                             ShowSnackBar.buildErrorSnackbar(
//                                 context, 'Could not send OTP', Colors.red);
//                           }
//                         })
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               child: authViewModel.loading
//                   ? const Center(
//                       child: ProgressDialog(
//                         message: 'Loading....',
//                       ),
//                     )
//                   : const SizedBox(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
