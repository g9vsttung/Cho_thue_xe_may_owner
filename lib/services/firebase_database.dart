import 'dart:developer';

import 'package:chothuexemay_owner/utils/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final database = FirebaseDatabase.instance.reference();

class FirebaseDatabaseCustom {
  String userId = "";
  final String _pathOwnerLocation = 'locations/owners/';
  final String _locationChild = "location";

  Future _checkExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(GlobalDataConstants.USERID)!;
    DataSnapshot snapshot =
        await database.child(_pathOwnerLocation + userId).once();
    return snapshot.value != null;
  }

  Future<void> storingLocationRealtime() async {
    if (await _checkExist()) {
      _updateLocation('Testing data update');
    } else {
      _writeLocation('Testing data');
    }
  }

  void _writeLocation(String location) {
    database
        .child(_pathOwnerLocation + userId)
        .set({_locationChild: location})
        .then((value) => log("Location updated!"))
        .catchError((error) => {log(error.toString())});
  }

  void _updateLocation(String location) {
    database
        .child(_pathOwnerLocation + userId)
        .update({_locationChild: location})
        .then((value) => log("Update store location to FirebaseDB"))
        .catchError((error) => {log(error.toString())});
  }
}
