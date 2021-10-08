// ignore_for_file: file_names

import 'dart:convert';
import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:http/http.dart' as http;

class OwnerService {
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

  Future<void> login(String uid, String accessToken) async {
    final response = await http.post(
      Uri.parse(OwnerApiPath.LOGIN),
      headers: <String, String>{
        'Content-Type': 'application/json ; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'accessToken': accessToken, 'googleId': uid}),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('Login success');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to Login');
    }
  }
}
