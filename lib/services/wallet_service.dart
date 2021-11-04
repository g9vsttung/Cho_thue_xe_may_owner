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
}
