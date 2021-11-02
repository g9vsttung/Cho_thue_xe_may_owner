import 'dart:io';

import 'package:chothuexemay_owner/utils/constants.dart';

class Bike {
  String id = "";
  String licensePlate = "";
  String color = "";
  String modelYear = "";
  String ownerId = "";
  String categoryId = "";
  int status = 0;
  String ownerPhone = "";
  String ownerName = "";
  String address = "";
  double rating = 0;
  int numberOfRating = 0;
  String brandName = "";
  String brandId = "";
  String categoryName = "";
  String imgPath = "";
  //Extra
  File? imgFile;
  File? imgFileOld;
  Bike(
      {required this.id,
      required this.licensePlate,
      required this.color,
      required this.modelYear,
      required this.ownerId,
      required this.categoryId,
      required this.status,
      required this.ownerPhone,
      required this.ownerName,
      required this.address,
      required this.rating,
      required this.numberOfRating,
      required this.brandName,
      required this.categoryName,
      required this.imgPath,
      required this.brandId});
  Bike.createBike(this.licensePlate, this.color, this.modelYear,
      this.categoryId, this.imgFile);
  Bike.updateBike(this.id, this.licensePlate, this.color, this.modelYear,
      this.categoryId, this.status, this.imgFile, this.imgFileOld);
  Bike.deleteBike(this.id, this.imgFile);
  factory Bike.jsonFrom(Map<String, dynamic> json) {
    return Bike(
        id: json['id'],
        licensePlate: json['licensePlate'],
        color: json['color'],
        modelYear: json['modelYear'],
        ownerId: json['ownerId'],
        categoryId: json['categoryId'],
        status: json['status'],
        ownerPhone: json['ownerPhone'] ?? "",
        ownerName: json['ownerName'] ?? "Unknow",
        address: json['address'] ?? "",
        rating: json['rating'] ?? 0,
        numberOfRating: json['numberOfRating'] ?? 0,
        brandName: json['brandName'] ?? "",
        categoryName: json['categoryName'] ?? "",
        imgPath: json['imgPath'] == null
            ? ImageConstants.IMAGE_DEFAULT_PATH
            : ImageConstants.getFullImagePath(json['imgPath']),
        brandId: json['brandId'] ?? "");
  }
}
