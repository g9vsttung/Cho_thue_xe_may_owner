// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/services/firebase_database.dart';
import 'package:chothuexemay_owner/services/firebase_storage.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerService {
  final _firebaseRealtimeService = FirebaseDatabaseCustom();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FirebaseStorageCustom _firebaseStorageCustom = FirebaseStorageCustom();
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
      final body = jsonDecode(response.body);
      String fullName = body['fullName'];
      await _preference.setString(GlobalDataConstants.USER_NAME, fullName);
      String token = body['token'];
      await _preference.setString(GlobalDataConstants.TOKEN, token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      log(payload["id"]);
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
    Uri url = Uri.parse(OwnerApiPath.GET_LIST_BIKE_BY_ID + ownerId);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable bikes = body;
      return bikes.map((o) => Bike.jsonFrom(o)).toList();
    } else if (response.statusCode == 404) {
      return [];
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

  Future<Owner> viewProfile() async {
    final SharedPreferences _preference = await SharedPreferences.getInstance();
    String ownerId =
        _preference.getString(GlobalDataConstants.USERID).toString();
    Uri url = Uri.parse(OwnerApiPath.VIEW_PROFILE + ownerId);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Owner.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<bool> updateProfile(Owner owner) async {
    //Storing and get image path
    String imgPath = owner.imgPath.replaceFirst(
        'https://firebasestorage.googleapis.com/v0/b/chothuexemay-35838.appspot.com/o/Avatars%2F',
        ''); //set default img to db
    imgPath = imgPath.replaceFirst(
        '?alt=media&token=0de320e1-51c3-403d-a55f-7f513fa272de', '');
    if (owner.imgFile != null) {
      try {
        imgPath = await _firebaseStorageCustom.uploadFile(owner.imgFile!);
        //delete old img
        if (owner.imgPath != ImageConstants.DEFAULT_IMG_NAME) {
          _firebaseStorageCustom.deleteFile(ImageConstants.getDeleteAvatarPath(
              ImageConstants.getAvatarPath(owner.imgPath)));
        }
        if (imgPath == "") {
          log('Cannot upload img to FirebaseStorage');
          return false;
        } else {
          log('Upload img to FirebaseStorage successfully!');
        }
      } catch (e) {
        log('No img added');
      }
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.put(Uri.parse(OwnerApiPath.VIEW_PROFILE),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode({
          "id": prefs.getString(GlobalDataConstants.USERID).toString(),
          "phoneNumber": owner.phoneNumber,
          "fullname": owner.fullname,
          "address": owner.address,
          'imgpath': imgPath
        }));
    return response.statusCode == 200;
  }

  Future<int> register(
      String email, String accessToken, String displayName) async {
    final response = await http.post(
      Uri.parse(OwnerApiPath.REGISTER),
      headers: <String, String>{
        'Content-Type': 'application/json ; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "accessToken": accessToken,
        "owner": <String, String>{
          "phoneNumber": "",
          "identityNumber": "",
          "fullname": displayName,
          "address": "",
          "identityImg": "",
          "mail": email
        }
      }),
    );
    //Store data
    if (response.statusCode == 200) {
      final SharedPreferences _preference =
          await SharedPreferences.getInstance();
      final body = jsonDecode(response.body);
      String fullName = displayName;
      await _preference.setString(GlobalDataConstants.USER_NAME, fullName);
      String token = body['token'];
      await _preference.setString(GlobalDataConstants.TOKEN, token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      log(payload["id"]);
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
}
