import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';
import 'package:chothuexemay_owner/models/feedback_model.dart';

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
  String? customerName;
  String? customerPhone;
  FeedbackModel? feedback;

  Booking(
      {required this.id,
      required this.address,
      required this.bikeId,
      required this.dateRent,
      required this.dateReturnExpected,
      required this.dateReturnActual,
      required this.price,
      required this.paymentMethod,
      required this.status,
      required this.bike,
      String? customerName,
      String? customerPhone,
      FeedbackModel? feedback}) {
    if (customerName != null) {
      this.customerName = customerName;
    }
    if (customerPhone != null) {
      this.customerPhone = customerPhone;
    }
    if (feedback != null) {
      this.feedback = feedback;
    }
  }
}
