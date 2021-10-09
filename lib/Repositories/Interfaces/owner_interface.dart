import '../generic_repository.dart';

abstract class IOwnerRepository extends GenericRepository {
  Future<int> login(String uid, String accessId);
}
