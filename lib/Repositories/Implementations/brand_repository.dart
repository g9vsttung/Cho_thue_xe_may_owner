import 'package:chothuexemay_owner/Repositories/Interfaces/brand_interface.dart';
import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/services/brand_service.dart';

class BrandRepository implements IBrandRepository {
  BrandService service = BrandService();
  @override
  Future<List<Brand>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }
}
