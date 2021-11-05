import 'package:chothuexemay_owner/Repositories/Implementations/category_repository.dart';
import 'package:chothuexemay_owner/Repositories/Interfaces/category_interface.dart';
import 'package:chothuexemay_owner/models/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryViewModel extends ChangeNotifier {
  final ICategoryRepository _repository = CategoryRepository();
  Future<List<Category>> getAll() async {
    return await _repository.getAll();
  }
}
