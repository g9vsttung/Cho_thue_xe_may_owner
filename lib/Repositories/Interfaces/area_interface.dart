import 'package:chothuexemay_owner/Repositories/generic_repository.dart';
import 'package:chothuexemay_owner/models/area_model.dart';

abstract class IAreaRepository extends GenericRepository {
  Future<Area> getAreaByName(String city);
}
