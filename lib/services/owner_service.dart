// ignore_for_file: file_names

import 'dart:convert';
import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/services/firebase_database.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerService {
  final _firebaseRealtimeService = FirebaseDatabaseCustom();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<List<Owner>> getAll() async {
    Uri url = Uri.parse(OwnerApiPath.GET_ALL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable owners = body;
      return owners.map((o) => Owner.jsonFrom(o)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<int> login(String uid, String accessToken) async {
    final response = await http.post(
      Uri.parse(OwnerApiPath.LOGIN),
      headers: <String, String>{
        'Content-Type': 'application/json ; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'accessToken': accessToken, 'googleId': uid}),
    );
    //Store data
    if (response.statusCode == 200) {
      final SharedPreferences _preference =
          await SharedPreferences.getInstance();
      String token = response.body;
      await _preference.setString(GlobalDataConstants.TOKEN, token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      await _preference.setString(GlobalDataConstants.USERID, payload["id"]);
      //Location
      _firebaseRealtimeService.storingLocationRealtime();
      //FCM token
      _fcm.getToken().then((token) {
        _firebaseRealtimeService.updateTokenFCM(token!);
      });
    }

    return response.statusCode;
  }

  Future<List<Bike>> getListBike() async {
    final SharedPreferences _preference = await SharedPreferences.getInstance();
    String ownerId =
        _preference.getString(GlobalDataConstants.USERID).toString();
    Uri url = Uri.parse(OwnerApiPath.GET_BY_ID + ownerId);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable bikes = body["listBike"];
      return bikes.map((o) => Bike.jsonFrom(o)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<int> acceptOrder(String customerId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse(
        "http://18.138.110.46/api/v2/owners/sendBookingReply?ownerId=${prefs.getString(GlobalDataConstants.USERID).toString()}&customerId=$customerId&isAccepted=true");
    final header = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: header);
    return response.statusCode;
  }

  Future<int> denyOrder(String customerId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(
            "http://18.138.110.46/api/v2/owners/sendBookingReply?ownerId=${prefs.getString(GlobalDataConstants.USERID).toString()}&isAccepted=false&customerId=$customerId"),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        });
    return response.statusCode;
  }
}
