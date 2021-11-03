class TransactionHistory {
  bool action;
  double amount;
  DateTime date;
  String id;

  TransactionHistory(
      {required this.action,
      required this.amount,
      required this.date,
      required this.id});
}
