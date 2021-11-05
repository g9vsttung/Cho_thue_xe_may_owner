import 'dart:convert';

import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FeedbackService {
  Future<List<FeedbackModel>> getAll() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(FeedbackApiPath.GET_ALL);
    final headers = <String, String>{
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Iterable feedbacks = body;
      return feedbacks.map((e) => FeedbackModel.jsonFrom(e)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
