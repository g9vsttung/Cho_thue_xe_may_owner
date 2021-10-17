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
  final String _pathCustomerLocation = 'locations/customers/';
  final String _latitudeChild = "latitude";
  final String _longitudeChild = "longitude";

  Future _checkExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(GlobalDataConstants.USERID)!;
    DataSnapshot snapshot =
        await database.child(_pathOwnerLocation + userId).once();
    return snapshot.value != null;
  }

  //Đặt bên customer và getOwnerLocation
  Future<Map<String, LatLng>> getCustomerLocation() async {
    Map<String, LatLng> listResult = Map();
    DataSnapshot snapshot = await database.child(_pathCustomerLocation).once();
    Map x = snapshot.value;
    if (snapshot.value != null) {
      snapshot.value.forEach((k, v) =>
          {listResult['${k}'] = LatLng(v['latitude'], v['longitude'])});
    }
    return listResult;
  }

  Future<void> storingLocationRealtime() async {
    Map<String, LatLng> list = await getCustomerLocation();
    _geoLocatorCustom.determinePosition();
    final _latlng = await _geoLocatorCustom.determinePosition();
    String end = '(${_latlng.latitude},${_latlng.longitude})';
    list.forEach((key, value) {
      String start = '(${value.latitude},${value.longitude})';
      distanceCalculator(start, end);
    });
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

  void distanceCalculator(String start, String end) async {
    final queryParameters = {
      'start_point': start,
      'end_point': end,
      'unit': 'kilometers'
    };
    final headers = {
      'content-type': 'application/json',
      'x-rapidapi-host': 'distance-calculator.p.rapidapi.com',
      'x-rapidapi-key': 'SIGN-UP-FOR-KEY',
      'useQueryString': 'true'
    };
    Uri url = Uri.https(
        'www.myurl.com',
        'https://distance-calculator.p.rapidapi.com/v1/one_to_one',
        queryParameters);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      log(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
