import 'dart:convert';
import 'dart:developer';

import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingService {
  Future<List<BookingTranstion>> getBookingTransactions() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_ALL_TRANSACTIONS);
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable transactions = body['data'];
      return transactions.map((e) => BookingTranstion.jsonFrom(e)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<BookingTranstion> getById(String id) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_BY_ID + id);
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return BookingTranstion.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<BookingTranstion>> getHistoryBookingTransactions(
      int page, int size) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(
        BookingApiPath.GET_ALL_TRANSACTIONS + '?status=1&size=2&pageNum=$page');
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable transactions = body['data'];
      return transactions.map((e) => BookingTranstion.jsonFrom(e)).toList();
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<BookingTranstion>> getOngoingBookingTransactions(
      int page, int size) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_ALL_TRANSACTIONS +
        '?status=0&size=$size&pageNum=$page');
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable transactions = body['data'];
      return transactions.map((e) => BookingTranstion.jsonFrom(e)).toList();
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<bool> cancelBooking(String id) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_ALL_TRANSACTIONS);

    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode({"id": id, "status": 3}));

    return response.statusCode == 200;
  }

  Future requestMoveBookingToInProgress(String id) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final headers = <String, String>{
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    Uri url = Uri.parse(BookingApiPath.SEND_CONFIRM_NOTI + id);
    final reponse = await http.get(url, headers: headers);
    log('Sending Confirm Notification Response Code :' +
        reponse.statusCode.toString());
    return reponse.statusCode == 200;
  }
}
