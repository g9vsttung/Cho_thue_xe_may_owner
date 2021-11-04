import 'package:chothuexemay_owner/Repositories/Implementations/owner_repository.dart';
import 'package:chothuexemay_owner/Repositories/Interfaces/owner_interface.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';
import 'package:flutter/material.dart';

class OwnerViewModel extends ChangeNotifier {
  final List<Bike> bikes = [];
  IOwnerRepository ownerRepository = OwnerRepository();

  Future getBikes() async {
    bikes.clear();
    await ownerRepository
        .getListBike()
        .then((value) => value.forEach((element) {
              bikes.add(element);
            }));
    notifyListeners();
  }

  void acceptOrder(String customerId) {
    ownerRepository.acceptOrder(customerId);
  }

  void denyOrder(String customerId) {
    ownerRepository.denyOrder(customerId);
  }

  Future<Owner> viewProfile() async {
    return await ownerRepository.viewProfile();
  }

  Future<Wallet> getWallet() async {
    return await ownerRepository.getWallet();
  }
}
