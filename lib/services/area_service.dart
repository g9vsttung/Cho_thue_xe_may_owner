import 'dart:convert';

import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/area_model.dart';

import 'package:http/http.dart' as http;

class AreaService {
  Future<List<Area>> getAll() async {
    Uri url = Uri.parse(AreaApiPath.GET_ALL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable areas = body;
      return areas.map((area) => Area.jsonFrom(area)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<Area> getAreaByName(String city) async {
    Uri url = Uri.parse(AreaApiPath.GET_BY_NAME);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Area.jsonFrom(body["data"]);
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
