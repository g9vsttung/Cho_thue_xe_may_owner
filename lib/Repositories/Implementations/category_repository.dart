import 'package:chothuexemay_owner/Repositories/Interfaces/category_interface.dart';
import 'package:chothuexemay_owner/models/category_model.dart';
import 'package:chothuexemay_owner/services/category_service.dart';

class CategoryRepository implements ICategoryRepository {
  final CategoryService _service = CategoryService();
  @override
  Future<List<Category>> getAll() async {
    return _service.getAll();
  }
}
