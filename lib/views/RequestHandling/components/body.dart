import 'dart:io';

import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
  @override
  Widget build(BuildContext context) {
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
                            // Text(
                            //   "Tên:",
                            //   style: TextStyle(
                            //       fontSize: 18, fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
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
                            // Text(
                            //   widget.order.customerName,
                            //   style: TextStyle(fontSize: 18),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Text(
                              widget.order.dateRent,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.order.dateReturn,
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
                widget.order.price.round().toString() + ".000 vnđ",
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
                    onPressed: () {},
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
                    onPressed: () {},
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
