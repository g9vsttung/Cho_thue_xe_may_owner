import 'dart:convert';

import 'package:chothuexemay_owner/apis/common.dart';
import 'package:chothuexemay_owner/models/history_wallet_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WalletService {
  Future<Wallet> getWallet() async {
    final SharedPreferences _preference = await SharedPreferences.getInstance();
    Uri url = Uri.parse(WalletApiPath.GET_WALLET +
        _preference.getString(GlobalDataConstants.USERID).toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Wallet.jsonFrom(jsonDecode(response.body));
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future createWallet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(WalletApiPath.CREATE);

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode(<String, String>{
          "id": prefs.getString(GlobalDataConstants.USERID).toString(),
          "momoId": "",
          "bankId": "",
          "bankName": ""
        }));
    return response.statusCode == 200;
  }

  Future<List<TransactionHistory>> getWalletTransaction() async {
    final SharedPreferences _preference = await SharedPreferences.getInstance();
    Uri url = Uri.parse(WalletApiPath.GET_HISTORY_TRANSACTIONS +
        _preference.getString(GlobalDataConstants.USERID).toString());
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Iterable transactions = body['data'];
      return transactions.map((e) => TransactionHistory.jsonFrom(e)).toList();
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
