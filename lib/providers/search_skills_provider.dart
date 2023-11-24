import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsmen/models/skill_provider_models.dart';
import 'package:craftsmen/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';


class SearchSkillProvider extends ChangeNotifier {
  static final SearchSkillProvider _instance = SearchSkillProvider._();

  SearchSkillProvider._();

  static SearchSkillProvider get instance {
    return _instance;
  }

  final _firestore = FirebaseFirestore.instance;
  final geo = Geoflutterfire();
  final userProv = UserProvider.instance;

  List<SkillProviderModel> allCraftmen = [];

  Future<List<SkillProviderModel>> searchSkills(String search) async {
    final snapshop = await _firestore
        .collection("Skill Providers")
        .where("Skill",
            isGreaterThanOrEqualTo: search.toLowerCase(),
            isLessThan: search.toLowerCase().substring(0, search.length - 1) +
                String.fromCharCode(search
                        .toLowerCase()
                        .codeUnitAt(search.toLowerCase().length - 1) +
                    1))
        .get();
    allCraftmen =
        snapshop.docs.map((e) => SkillProviderModel.fromSnapshot(e)).toList();
    return allCraftmen;
  }

  Stream<List<DocumentSnapshot>> searchLocations(String search) {
    GeoFirePoint center = geo.point(
        latitude: userProv.userApiData.latitute!,
        longitude: userProv.userApiData.longitude!);

    var collectionReference = _firestore
        .collection('Skill Providers')
        .where('Skill', isEqualTo: search);

    Stream<List<DocumentSnapshot>> stream = geo
        .collection(collectionRef: collectionReference)
        .within(center: center, radius: 50, field: 'position');

    return stream;
  }
}
