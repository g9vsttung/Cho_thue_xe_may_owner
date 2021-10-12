import 'package:chothuexemay_owner/Repositories/Implementations/owner_repository.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:flutter/material.dart';

class OwnerViewModel extends ChangeNotifier {
  final List<Bike> bikes = [];
  //final Map<Brand, List<Category>> brandCates = {};
  OwnerRepository ownerRepository = OwnerRepository();
  void getBikes() async {
    bikes.clear();
    await ownerRepository
        .getListBike()
        .then((value) => value.forEach((element) {
              bikes.add(element);
            }));
    notifyListeners();
  }
}
