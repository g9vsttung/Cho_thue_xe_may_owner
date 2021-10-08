import '../generic_repository.dart';

abstract class IOwnerRepository extends GenericRepository {
  Future<void> login(String uid, String accessId);
}
