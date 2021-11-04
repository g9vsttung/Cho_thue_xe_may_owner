import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/booking_model.dart';
import 'package:chothuexemay_owner/models/customer_model.dart';
import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/AppointmentDetail/appointment_detail_view.dart';
import 'package:chothuexemay_owner/views/Feedback/feedback_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyAppointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyAppointment();
  }
}

class _BodyAppointment extends State<BodyAppointment> {
  String selectedCate = "renting";
  List<Booking> list = [
    Booking(
        id: "1",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 120000,
        paymentMethod: "Tiền mặt",
        address: "address",
        status: 0,
        customerName: "Nguyen Van A",
        customerPhone: "0777997001",
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d",
            brandId: '')),
    Booking(
        id: "1",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 135000,
        paymentMethod: "paypal",
        address: "address",
        status: 1,
        customerName: "Nguyen Van A",
        customerPhone: "0777997001",
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d",
            brandId: '')),
    Booking(
        id: "1",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 135000,
        paymentMethod: "paypal",
        address: "address",
        status: 3,
        customerName: "Nguyen Van A",
        customerPhone: "0777997001",
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d",
            brandId: '')),
    Booking(
        id: "1",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 135000,
        paymentMethod: "paypal",
        address: "address",
        status: 3,
        customerName: "Nguyen Van A",
        customerPhone: "0777997001",
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d",
            brandId: '')),
    Booking(
        id: "1",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 135000,
        paymentMethod: "paypal",
        address: "address",
        status: 2,
        customerName: "Nguyen Van A",
        customerPhone: "+84792384073",
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d",
            brandId: '')),
    Booking(
        id: "1",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 250000,
        paymentMethod: "paypal",
        address: "address",
        status: 2,
        customerName: "Nguyen Van A",
        customerPhone: "0777997001",
        feedback:
            FeedbackModel(content: "content", rating: 4, date: "20/11/2021"),
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d",
            brandId: ''))
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            color: Colors.white,
            child: cateNavBar(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(child: listAppointmentByCate())),
        ],
      ),
    );
  }

  Widget listAppointmentByCate() {
    if (selectedCate == "renting") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (Booking booking in list)
            if (booking.status == 0 || booking.status == 1)
              rentDetailBox(booking),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (Booking booking in list)
            if (booking.status == 2 || booking.status == 3)
              rentDetailBox(booking),
        ],
      );
    }
  }

  Widget cateNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //=====================MASSAGE
        if (selectedCate == "renting")
          Container(
              padding: const EdgeInsets.only(
                bottom:
                    2, // This can be the space you need betweeb text and underline
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: ColorConstants.textBold,
                width: 3, // This would be the width of the underline
              ))),
              child: const Text(
                "Đang cho thuê",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 4,
                ),
              ))
        else
          GestureDetector(
              onTap: () {
                setState(() {
                  selectedCate = "renting";
                });
              },
              child: const Text(
                "Đang cho thuê",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),

        //=====================FACIAL
        if (selectedCate == "history")
          Container(
              padding: const EdgeInsets.only(
                bottom:
                    2, // This can be the space you need betweeb text and underline
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: ColorConstants.textBold,
                width: 3, // This would be the width of the underline
              ))),
              child: const Text(
                "Lịch sử cho thuê",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorConstants.textBold,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 4),
              ))
        else
          GestureDetector(
            onTap: () {
              setState(() {
                selectedCate = "history";
              });
            },
            child: const Text("Lịch sử cho thuê",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
      ],
    );
  }

  Widget rentDetailBox(Booking booking) {
    Size size = MediaQuery.of(context).size;
    Color color = Colors.blueAccent;
    String icon = "";
    String status = "";
    if (booking.status == 0) {
      color = Colors.orange;
      icon = "pending.png";
      status = "Chờ nhận xe";
    } else if (booking.status == 1) {
      color = Colors.blueAccent;
      icon = "inProcess.png";
      status = "Đang thuê";
    } else if (booking.status == 2) {
      color = Colors.green;
      icon = "finished.png";
      status = "Hoàn thành";
    } else if (booking.status == 3) {
      color = Colors.red;
      icon = "canceled.png";
      status = "Hủy";
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Image.asset(
                      StringConstants.iconDirectory + icon,
                      width: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      status,
                      style: TextStyle(fontSize: 16, color: color),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    if (booking.status == 0 || booking.status == 2)
                      Image.asset(
                        StringConstants.iconDirectory + "point.png",
                        width: 3,
                        color: color,
                      ),
                    SizedBox(
                      width: 7,
                    ),
                    if (booking.status == 0)
                      Text(
                        booking.dateRent.toString().split(" ")[0],
                        style: TextStyle(fontSize: 16, color: color),
                      ),
                    if (booking.status == 2)
                      Text(
                        booking.dateReturnActual.toString().split(" ")[0],
                        style: TextStyle(fontSize: 16, color: color),
                      )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        booking.bike.categoryName,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Image.asset(
                        StringConstants.iconDirectory + "point.png",
                        width: 2,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        booking.bike.modelYear,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Giá: " + booking.price.round().toString() + " đ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AppointmentDetailView(booking: booking);
                    },
                  ));
                },
                icon: Image.asset(
                  StringConstants.iconDirectory + "detail.png",
                ),
                iconSize: 30,
              )
            ],
          ),
        ),
        SizedBox(
          height: 1,
        ),
        getActionButton(booking),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget getActionButton(Booking booking) {
    MainAxisAlignment ali = MainAxisAlignment.center;
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    // if (booking.status == 2) {
    //   ali = MainAxisAlignment.spaceBetween;
    //   width = size.width * 0.498;
    // }
    return Row(
      mainAxisAlignment: ali,
      children: [
        GestureDetector(
          onTap: () {
            launch("tel://" + booking.customerPhone!);
          },
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            width: width,
            color: Colors.white,
            child: const Center(
              child: Text(
                "Liên hệ",
                style: TextStyle(fontSize: 18, color: ColorConstants.textBold),
              ),
            ),
          ),
        )
      ],
    );
  }

  showMyAlertDialog(Booking booking) {
    Size size = MediaQuery.of(context).size;

    Dialog dialog = Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.containerBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Đánh giá của bạn",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Rate: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  for (int i = 1; i <= booking.feedback!.rating; i++)
                    Image.asset(
                      StringConstants.iconDirectory + "starRating.png",
                      width: 18,
                    ),
                  for (int i = 1; i <= 5 - booking.feedback!.rating; i++)
                    Image.asset(
                      StringConstants.iconDirectory + "starBorder.png",
                      width: 18,
                    ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                booking.feedback!.date,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                booking.feedback!.content,
                style: TextStyle(fontSize: 16),
                maxLines: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                          fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
    Future<dynamic> futureValue = showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return dialog;
      },
    );
  }
}
