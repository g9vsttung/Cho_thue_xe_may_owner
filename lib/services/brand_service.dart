import 'dart:convert';

import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:http/http.dart' as http;

class BrandService {
  Future<List<Brand>> getAll() async {
    Uri url = Uri.parse(BrandApiPath.GET_ALL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable brand = body;
      return brand.map((brand) => Brand.jsonFrom(brand)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
