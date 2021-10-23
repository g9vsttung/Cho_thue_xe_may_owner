import 'dart:convert';
import 'dart:developer';
import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/services/firebase_storage.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BikeService {
  //store images
  final FirebaseStorageCustom _firebaseStorageCustom = FirebaseStorageCustom();

  Future<List<Bike>> getAll() async {
    Uri url = Uri.parse(BikeApiPath.GET_ALL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable bikes = body;
      return bikes.map((bike) => Bike.jsonFrom(bike)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<bool> createNewBike(Bike bike) async {
    //Storing and get image path
    String imgPath = ImageConstants.DEFAULT_IMG_NAME;
    if (bike.imgFile != null) {
      try {
        imgPath = await _firebaseStorageCustom.uploadFile(bike.imgFile!);
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
    final response = await http.post(Uri.parse(BikeApiPath.CREATE_BIKE),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode(<String, String>{
          'licensePlate': bike.licensePlate,
          'color': bike.color,
          'modelYear': bike.modelYear,
          'ownerId': prefs.getString(GlobalDataConstants.USERID).toString(),
          'categoryId': bike.categoryId,
          'imgPath': imgPath
        }));
    return response.statusCode == 200;
  }

  Future<Bike> getById(String id) async {
    Uri url = Uri.parse(BikeApiPath.GET_BY_ID + id);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Bike.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<bool> deleteBike(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final request = http.Request("DELETE", Uri.parse(BikeApiPath.DELETE_BIKE));
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
    });
    request.body = jsonEncode({id});
    final response = await request.send();
    return response.statusCode == 200;
  }

  Future<bool> updateBike(Bike bike) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final request = http.Request("PUT", Uri.parse(BikeApiPath.UPDATE_BIKE));
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
    });
    request.body = jsonEncode({
      "id": bike.id,
      "licensePlate": bike.licensePlate,
      "color": bike.color,
      "modelYear": bike.modelYear,
      "imgPath": bike.imgPath, //Có thể không đúng tên ảnh
      "status": bike.status //Xem lại status đúng kiểu int chưa
    });
    final response = await request.send();
    return response.statusCode == 200;
  }
}
