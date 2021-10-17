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
    final _latlng = await _geoLocatorCustom.determinePosition();
    String start = '${_latlng.latitude},${_latlng.longitude}';
    String ends = "";
    list.forEach((key, value) {
      ends += '${value.latitude},${value.longitude}|';
    });
    distanceCalculator(
        start, ends.replaceRange(ends.length - 1, ends.length, ''));
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

  // ignore: slash_for_doc_comments
  /**Booking flow
   * 1st: when users login -> store location in FirebaseRealtime
   * 2st: when customer clicks 'Confirm Booking' -> Send [areaId, motorType]  -> find area by name to get ID 
   * 3st: BE returns a list of owners have in the area for 'customers system' -> compare distances 
   *                                                                         -> show notification for owner . Over 1min , skip and go to next owner
   * 4st: if one owner accept -> return success screen
   *      else over 3 mins -> customer: please try again
   */
  // this function will be called when user click booking
  void distanceCalculator(String start, String ends) async {
    //This list store distance from the start point to the destination pointS by meters.
    List<int> distanceList = [];
    const String _key = 'MkP5cLaGx6mRgulWqb7dSEkFPlZqLsCDNq1ZUku1';

    Uri url = Uri.parse(
        'https://rsapi.goong.io/DistanceMatrix?origins=${start}&destinations=${ends}&vehicle=bike&api_key=${_key}');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final result = body['rows'][0]['elements'];
      result.forEach((r) => {
            if (r['status'] == 'OK') {distanceList.add(r['distance']['value'])}
          });
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
