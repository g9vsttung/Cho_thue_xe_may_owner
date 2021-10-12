import 'package:chothuexemay_owner/models/bike_model.dart';

import '../generic_repository.dart';

abstract class IOwnerRepository extends GenericRepository {
  Future<int> login(String uid, String accessId);
  Future<List<Bike>> getListBike();
}
