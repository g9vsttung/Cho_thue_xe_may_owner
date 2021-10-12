import 'dart:convert';
import 'dart:developer';
import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BikeService {
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BikeApiPath.CREATE_BIKE),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          // 'Authorization':
          //     'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode(<String, String>{
          'licensePlate': bike.licensePlate.trim(),
          'color': bike.color,
          'modelYear': bike.modelYear,
          'ownerId': prefs.getString(GlobalDataConstants.USERID).toString(),
          'categoryId': bike.categoryId
        }));
    log(prefs.getString(GlobalDataConstants.TOKEN).toString());
    return response.statusCode == 200;
  }
}
