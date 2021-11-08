import 'package:chothuexemay_owner/models/history_wallet_model.dart';

class Wallet {
  double balance;
  String? id;
  String? momoId;
  String? bankId;
  String? bankName;
  List<TransactionHistory>? history;
  Wallet(
      {required this.id,
      required this.balance,
      required this.momoId,
      required this.bankId,
      required this.bankName});
  Wallet.general({required this.balance, required this.history});

  factory Wallet.jsonFrom(Map<String, dynamic> json) {
    return Wallet(
        id: json['id'] ?? "",
        balance: json['balance'].toDouble() ?? 0,
        momoId: json['momoId'] ?? "",
        bankId: json['bankId'] ?? "",
        bankName: json['bankName'] ?? "");
  }
}
