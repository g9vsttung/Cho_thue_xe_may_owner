import 'package:chothuexemay_owner/Repositories/Interfaces/owner_interface.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/services/owner_service.dart';

class OwnerRepository implements IOwnerRepository {
  OwnerService service = OwnerService();
  @override
  Future<List<Owner>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }
}
