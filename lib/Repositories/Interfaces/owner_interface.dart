import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';

import '../generic_repository.dart';

abstract class IOwnerRepository extends GenericRepository {
  Future<int> login(String uid, String accessId);
  Future<List<Bike>> getListBike();
  Future<Owner> updateProfile(Owner owner);
  Future<bool> logout();
  Future<int> acceptOrder();
  Future<int> denyOrder();

}
