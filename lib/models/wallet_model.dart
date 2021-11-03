import 'package:chothuexemay_owner/models/history_wallet_model.dart';

class Wallet{
  double balance;
  List<TransactionHistory> history;

  Wallet({required this.balance,required  this.history});
}