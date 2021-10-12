class Category {
  String name;
  String id;
  int status;
  Category(this.name, this.id, this.status);
  factory Category.jsonFrom(Map<String, dynamic> json) {
    return Category(json['name'] ?? "", json['id'] ?? "", json['status'] ?? 0);
  }
}
