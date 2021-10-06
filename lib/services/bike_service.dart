import 'dart:convert';
import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:http/http.dart' as http;

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
}
