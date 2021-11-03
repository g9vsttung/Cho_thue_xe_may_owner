

import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';

class Booking {
  String id;
  String address;
  String bikeId;
  DateTime dateRent;
  DateTime dateReturnExpected;
  DateTime dateReturnActual;
  double price;
  String paymentMethod;
  int status;
  Bike bike;
  Customer customer;
  Booking({required this.id,
    required this.address,
    required this.bikeId,
    required this.dateRent,
    required this.dateReturnExpected,
    required this.dateReturnActual,
    required this.price,
    required this.paymentMethod,
    required this.status,
    required this.bike,
    required this.customer,});
}
