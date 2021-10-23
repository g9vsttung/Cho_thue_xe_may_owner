import 'dart:convert';
import 'dart:developer';

import 'package:chothuexemay_owner/services/geolocation_service.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final database = FirebaseDatabase.instance.reference();

class FirebaseDatabaseCustom {
  final GeoLocatorCustom _geoLocatorCustom = GeoLocatorCustom();
  String userId = "";
  final String _pathOwnerLocation = 'locations/owners/';
  final String _latitudeChild = "latitude";
  final String _longitudeChild = "longitude";
  final String _pathOwnerTokenFCM = "TokenFCM/owners";
  final String _tokenFCMChild = "token";

  Future _checkExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(GlobalDataConstants.USERID)!;
    DataSnapshot snapshot =
        await database.child(_pathOwnerLocation + userId).once();
    return snapshot.value != null;
  }

  //write user's location to FirebaseRealtime
  //Called when user logining
  Future<void> storingLocationRealtime() async {
    final _latlng = await _geoLocatorCustom.determinePosition();
    if (await _checkExist()) {
      _updateLocation(_latlng);
    } else {
      _writeLocation(_latlng);
    }
  }

  void _writeLocation(LatLng latLng) {
    database
        .child(_pathOwnerLocation + userId)
        .set({
          _latitudeChild: latLng.latitude,
          _longitudeChild: latLng.longitude
        })
        .then((value) => log("Location updated!"))
        .catchError((error) => {log(error.toString())});
  }

  void _updateLocation(LatLng latLng) {
    database
        .child(_pathOwnerLocation + userId)
        .update({
          _latitudeChild: latLng.latitude,
          _longitudeChild: latLng.longitude
        })
        .then((value) => log("Update store location to FirebaseDB"))
        .catchError((error) => {log(error.toString())});
  }

  //Storing token firebase cloud messaging
  Future updateTokenFCM(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(GlobalDataConstants.USERID)!;
    await database
        .child(_pathOwnerTokenFCM + userId)
        .set({
          _tokenFCMChild: token,
        })
        .then((value) => log("Token FCM updated!"))
        .catchError((error) => {log(error.toString())});
  }
}
