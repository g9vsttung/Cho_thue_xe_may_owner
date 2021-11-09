import 'dart:io';

import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';

class Owner {
  String id;
  String phoneNumber;
  String fullname;
  String address;
  int status;
  int? banTimes;
  String? adminId;
  String? areaId;
  String mail;
  int? numberOfbikes;
  double rating;
  int numberOfRatings;
  String imgPath;
  File? imgFile;
  List<FeedbackModel>? feedbacks;

  factory Owner.jsonFrom(Map<String, dynamic> json) {
    return Owner(
        id: json['id'],
        phoneNumber: json['phoneNumber'] ?? "",
        fullname: json['fullname'] ?? "",
        address: json['address'] ?? "",
        numberOfbikes: json['numberOfBikes'] ?? 0,
        rating: json['rating'] == null ? 0.0 : json['rating'].toDouble(),
        numberOfRatings: json['numberOfRatings'] ?? 0,
        adminId: json['adminId'] ?? "",
        areaId: json['areaId'] ?? "",
        banTimes: json['banTimes'] ?? 0,
        mail: json['mail'] ?? "",
        status: json['status'] ?? 0,
        imgPath: json['imgPath'] == null
            ? ImageConstants.IMAGE_AVATAR_DEFAULT_PATH
            : ImageConstants.getFullAvatarPath(json['imgPath']),
        feedbacks: (json['listFeedback'] == null
            ? []
            : (json['listFeedback'] as List)
                .map((e) => FeedbackModel.jsonFrom(e))
                .toList()));
  }

  //Constructor
  Owner(
      {required this.id,
      required this.phoneNumber,
      required this.fullname,
      required this.address,
      required this.numberOfbikes,
      required this.rating,
      required this.numberOfRatings,
      required this.areaId,
      required this.status,
      required this.adminId,
      required this.banTimes,
      required this.mail,
      required this.feedbacks,
      required this.imgPath});

  Owner.updateProfile({
    required this.fullname,
    required this.phoneNumber,
    required this.address,
    required this.imgPath,
    required this.imgFile,
    this.adminId = "",
    this.id = "",
    this.status = 0,
    this.mail = "",
    this.rating = 0,
    this.numberOfRatings = 0,
  });
}
