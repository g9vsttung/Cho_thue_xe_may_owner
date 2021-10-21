import 'package:chothuexemay_owner/Repositories/generic_repository.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';

abstract class IBikeRepository extends GenericRepository {
  Future<bool> createNewBike(Bike bike);
  Future<Bike> updateBike(Bike bike);
  Future<bool> deleteBike(String id);
}
