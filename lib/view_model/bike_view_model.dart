// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:chothuexemay_owner/Repositories/Implementations/bike_repository.dart';
import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeViewModel extends ChangeNotifier {
  final List<Bike> bikes = [];
  final BikeRepository _bikeRepository = BikeRepository();
  File? img;

  void getAll() async {
    bikes.clear();
    await _bikeRepository.getAll().then((value) => value.forEach((element) {
          bikes.add(element);
        }));
    notifyListeners();
  }

  Future<bool> createNewBike(Bike bike) async {
    return await _bikeRepository.createNewBike(bike);
  }

  Future<Bike> getById(String id) async {
    return await _bikeRepository.getById(id);
  }

  void setImage(File img) {
    this.img = img;
  }
}
