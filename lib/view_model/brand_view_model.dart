import 'package:chothuexemay_owner/Repositories/Implementations/brand_repository.dart';
import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:flutter/cupertino.dart';

class BrandViewModel extends ChangeNotifier {
  final List<Brand> brands = [];
  //final Map<Brand, List<Category>> brandCates = {};
  BrandRepository brandRepository = BrandRepository();
  void getAll() async {
    brands.clear();
    await brandRepository.getAll().then((value) => value.forEach((element) {
          brands.add(element);
        }));
    notifyListeners();
  }
}
