class OrderModel {
  String licensePlate;
  String bikeName;
  String bikeImage;
  String dateRent;
  String address;
  double price;
  String customerName;
  int timeRent = 0;
  String dateReturn = "";
  bool isRentByDate = true;

  OrderModel(
      {required this.licensePlate,
      required this.dateRent,
      required this.bikeName,
      required this.bikeImage,
      required this.address,
      required this.price,
      required this.customerName,
      String? dateReturn,
      int? timeRent,
      bool? isRentByDate}) {
    if (dateReturn != null) {
      this.dateReturn = dateReturn;
    }
    if (timeRent != null) {
      this.timeRent = timeRent;
    }
    if (isRentByDate != null) {
      this.isRentByDate = isRentByDate;
    }
  }

  factory OrderModel.jsonFromByDate(Map<String, dynamic> json) {
    return OrderModel(
        licensePlate: json['LicensePlate'],
        dateRent: json['DateRent'],
        bikeName: json['BikeName'],
        bikeImage: json['BikeImage'],
        address: json['Address'],
        price: json['Price'],
        customerName: json['CustomerName'],
        dateReturn: json['DateReturn']);
  }

  factory OrderModel.jsonFromByHour(Map<String, dynamic> json) {
    return OrderModel(
        licensePlate: json['LicensePlate'],
        dateRent: json['DateRent'],
        bikeName: json['BikeName'],
        bikeImage: json['BikeImage'],
        address: json['Address'],
        price: json['Price'],
        customerName: json['CustomerName'],
        timeRent: json['TimeRent'],
        isRentByDate: false);
  }
}
