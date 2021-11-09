import 'package:chothuexemay_owner/Repositories/Interfaces/bike_interface.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/services/bike_service.dart';

class BikeRepository implements IBikeRepository {
  BikeService service = BikeService();
  @override
  Future<List<Bike>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }

  @override
  Future<int> createNewBike(Bike bike) async {
    return service.createNewBike(bike);
  }

  @override
  Future<int> deleteBike(Bike bike) {
    return service.deleteBike(bike);
  }

  @override
  Future<int> updateBike(Bike bike) {
    return service.updateBike(bike);
  }

  @override
  Future<Bike> getById(String id) {
    return service.getById(id);
  }
}
