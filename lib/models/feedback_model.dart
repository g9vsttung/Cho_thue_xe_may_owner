class FeedbackModel {
  String id;
  String content;
  double rating;
  String date;

  FeedbackModel(
      {required this.id,
      required this.content,
      required this.rating,
      required this.date});

  factory FeedbackModel.jsonFrom(Map<String, dynamic> json) {
    return FeedbackModel(
        id: json["id"],
        content: json["content"],
        rating: json["rating"],
        date: json["date"]);
  }
}
