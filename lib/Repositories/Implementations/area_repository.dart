import 'package:chothuexemay_owner/Repositories/Interfaces/area_interface.dart';
import 'package:chothuexemay_owner/models/area_model.dart';
import 'package:chothuexemay_owner/services/area_service.dart';

class AreaRepository implements IAreaRepository {
  final AreaService _service = AreaService();
  @override
  Future<List<Area>> getAll() {
    return _service.getAll();
  }

  @override
  Future<Area> getAreaByName(String city) {
    return _service.getAreaByName(city);
  }
}
