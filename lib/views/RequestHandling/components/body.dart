import 'dart:io';

import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class BodyRequestHandling extends StatefulWidget {
  //OrderModel order=OrderModel(customerName: "Nguyễn Văn A",licensePlate: "AB231-SAS41", dateRent: "22/10/2221", bikeName: "Air Blade", bikeImage: "https://lh3.googleusercontent.com/proxy/aukiih8-NiuxNPOwTwwSA3GPhwjpNL64lZ_N172VE5M_LR7rET6C3D70bBRxEpSPSBnkU00X5pEQIZI_KgO4cHBxSS1OOP154QzaQXya5HGQLmbQvOqBPTSf8kJNDtHyFjQx", address: "95 đg 21", price: 130, dateReturn: "21/10/2221");
  OrderModel order;

  BodyRequestHandling({required this.order});

  @override
  State<StatefulWidget> createState() {
    return _BodyRequestHandling();
  }
}

class _BodyRequestHandling extends State<BodyRequestHandling> {
  OwnerViewModel _ownerViewModel = OwnerViewModel();
  //Format currency number
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]}.';
  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateTime dateRent = dateFormat.parse(widget.order.dateRent);
    DateTime dateReturn = dateFormat.parse(widget.order.dateReturn);
    String txtDateRent = dateRent.day.toString() +
        "/" +
        dateRent.month.toString() +
        "/" +
        dateRent.year.toString() +
        " - " +
        dateRent.hour.toString() +
        ":" +
        dateRent.minute.toString();
    String txtDateReturn = dateReturn.day.toString() +
        "/" +
        dateReturn.month.toString() +
        "/" +
        dateReturn.year.toString() +
        " - " +
        dateReturn.hour.toString() +
        ":" +
        dateReturn.minute.toString();
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Xe được chọn",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: ColorConstants.textBold),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.order.licensePlate + " ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Image.asset(StringConstants.iconDirectory + "point.png"),
                    Text(
                      " " + widget.order.bikeName,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.network(
                widget.order.bikeImage,
                width: size.width * 0.5,
                height: size.width * 0.4,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black, width: 1))),
                  ),
                  Text(
                    "Thông tin khách hàng",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black, width: 1))),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Tên:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ngày thuê:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ngày trả:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.order.customerName,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              txtDateRent,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              txtDateReturn,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      "Địa chỉ nhận xe:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.order.address,
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                StringConstants.iconDirectory + "price.png",
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.order.price
                        .round()
                        .toString()
                        .replaceAllMapped(reg, mathFunc) +
                    " vnđ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 45,
                  width: size.width * 0.46,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.redAccent,
                    onPressed: () {
                      _ownerViewModel.denyOrder(widget.order.customerId!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return HomeView();
                        }),
                      );
                    },
                    child: const Text(
                      "TỪ CHỐI",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  height: 45,
                  width: size.width * 0.46,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: ColorConstants.background,
                    onPressed: () {
                      _ownerViewModel.acceptOrder(widget.order.customerId!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return HomeView();
                        }),
                      );
                    },
                    child: const Text(
                      "CHẤP NHẬN",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
