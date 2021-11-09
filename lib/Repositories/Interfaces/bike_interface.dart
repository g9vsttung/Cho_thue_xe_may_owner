import 'package:chothuexemay_owner/Repositories/generic_repository.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';

abstract class IBikeRepository extends GenericRepository {
  Future<int> createNewBike(Bike bike);
  Future<int> updateBike(Bike bike);
  Future<int> deleteBike(Bike bike);
  Future<Bike> getById(String id);
}
