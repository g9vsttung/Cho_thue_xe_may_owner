class TransactionHistory {
  bool action;
  double amount;
  String date;
  String id;
  String bookingId;

  TransactionHistory(
      {required this.action,
      required this.amount,
      required this.date,
      required this.id,
      required this.bookingId});

  factory TransactionHistory.jsonFrom(Map<String, dynamic> json) {
    return TransactionHistory(
        id: json['id'] ?? "",
        action: json['action'] == false ? false : true,
        amount: json['amount'].toDouble() ?? 0,
        date: json['actionDate'] ?? "",
        bookingId: json['bookingId'] ?? "");
  }
}
