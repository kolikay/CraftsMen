// ignore_for_file: prefer_is_empty, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/const/shared_preferences.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusesable_appBar2.dart';
import 'package:craftsmen/constants/reusesable_widgets/searchDisplayCards.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/screens/search/singleSearchDisplayScreen.dart';
import 'package:units_converter/units_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class DisplayAllSearchScreen extends ConsumerStatefulWidget {
  const DisplayAllSearchScreen({Key? key, required this.service})
      : super(key: key);
  final String service;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DisplayAllSearchScreenState();
}

@override
void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_) {});
}

class _DisplayAllSearchScreenState
    extends ConsumerState<DisplayAllSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final searchResultProvider = ref.watch(searchProvider);
    final userProv = ref.watch(userProvider);
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(103.h),
            child: ReusesableAppBar2(
              appBarTitle: 'Nearby ${widget.service}',
              firstButton: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kMainColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          body: StreamBuilder<List<DocumentSnapshot>>(
              stream: searchResultProvider.searchLocations(widget.service),
              builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snap) {
                if (snap.connectionState == ConnectionState.active) {
                  if (snap.data!.length == 0) {
                    return Center(
                        child: NormalText(
                            text:
                                '${widget.service} are not available at the moment'));
                  } else if (snap.hasData) {
                    return ListView.builder(
                        itemCount: snap.data!.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snap.data![index];

                          GeoPoint distance = data.get('position')['geopoint'];

                          var lat = UserPreferences.getUserLat();
                          var lon = UserPreferences.getUserLon();
                      
                          var distanceBetween = Geolocator.distanceBetween(
                              // userProv.userApiData.latitute!,
                              // userProv.userApiData.longitude!,
                              lat!,
                              lon!,
                              distance.latitude,
                              distance.longitude);

                          return SearchDisplayCard(
                            name: data.get('Full Name'),
                            imageUrl: data.get('Profile Pic') == '' ||
                                    data.get('Profile Pic') == null
                                ? 'https://www.kindpng.com/picc/m/187-1875173_worker-icon-hd-png-download.png'
                                : data.get('Profile Pic'),
                            rating: '4.5',
                            distance:
                                '${distanceBetween.convertFromTo(LENGTH.meters, LENGTH.kilometers)!.toStringAsFixed(4)} KM away',
                            tapped: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => SingleSearchScreen(
                                        craftManDetails: data,
                                        distance: distanceBetween,
                                      )),
                                ),
                              );
                            },
                          );
                        });
                  }
                } else if (snap.hasError) {
                  return Center(
                      child: NormalText(
                    text: 'An Error Occured',
                    color: Colors.red,
                  ));
                } else if (snap.connectionState == ConnectionState.waiting) {
                  print('waiting');
                  return const Center(child: CircularProgressIndicator());
                }
                return Text(snap.connectionState.toString());
              }),
        ),

        // FutureBuilder<List<SkillProviderModel>>(
        //       future: searchResultProvider.searchSkills(widget.service),
        //       builder: (context, snap) {
        //         if (snap.connectionState == ConnectionState.done) {
        //           return ListView.builder(
        //               itemCount: searchResultProvider.allCraftmen.length,
        //               itemBuilder: (context, index) {
        //                 return SearchDisplayCard(
        //                   name:
        //                       searchResultProvider.allCraftmen[index].fullName!,
        //                   imageUrl: searchResultProvider
        //                               .allCraftmen[index].profilePic ==
        //                           ''
        //                       ? 'https://st2.depositphotos.com/4520249/7558/v/450/depositphotos_75585915-stock-illustration-construction-worker-icon.jpg'
        //                       : searchResultProvider
        //                           .allCraftmen[index].profilePic!,
        //                   rating: '4.5',
        //                   distance: snap.data![index].email!,
        //                   tapped: () async {
        //                     Navigator.of(context).push(
        //                       MaterialPageRoute(
        //                         builder: ((context) => SingleSearchScreen(
        //                               craftManDetails: searchResultProvider
        //                                   .allCraftmen[index],
        //                             )),
        //                       ),
        //                     );
        //                   },
        //                 );
        //               });
        //         } else if (snap.hasError) {
        //           return SizedBox();
        //         } else {
        //           return const Center(child: CircularProgressIndicator());
        //         }
        //       }),
        // ),
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
