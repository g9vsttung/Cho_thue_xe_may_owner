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
  Future<bool> createNewBike(Bike bike) async {
    return service.createNewBike(bike);
  }

  @override
  Future<bool> deleteBike(String id) {
    // TODO: implement deleteBike
    throw UnimplementedError();
  }

  @override
  Future<Bike> updateBike(Bike bike) {
    // TODO: implement updateBike
    throw UnimplementedError();
  }
}
