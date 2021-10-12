import 'package:chothuexemay_owner/models/category_model.dart';

import 'category_model.dart';

class Brand {
  String name;
  String id;
  int status;
  List<Category> categories;
  Brand(this.name, this.id, this.status, this.categories);
  factory Brand.jsonFrom(Map<String, dynamic> json) {
    return Brand(
        json['name'] ?? "",
        json['id'],
        json['status'] ?? 0,
        (json['listCategory'] == null
            ? []
            : (json['listCategory'] as List)
                .map((e) => Category.jsonFrom(e))
                .toList()));
  }
}
