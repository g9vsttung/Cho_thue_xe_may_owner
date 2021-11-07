// ignore_for_file: prefer_function_declarations_over_variables
import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class BodyAppointmentDetail extends StatefulWidget {
  BookingTranstion booking;

  BodyAppointmentDetail({Key? key, required this.booking}) : super(key: key);

  @override
  State<BodyAppointmentDetail> createState() => _BodyAppointmentDetail();
}

class _BodyAppointmentDetail extends State<BodyAppointmentDetail> {
  //Format currency number
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]}.';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "THÔNG TIN",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Ngày thuê:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.dateRentActual
                                .toString()
                                .substring(0, 16)
                                .replaceAll('T', ' '),
                            style: const TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Ngày trả:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.dateReturnActual
                                .toString()
                                .substring(0, 16)
                                .replaceAll('T', ' '),
                            style: const TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Loại xe:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.booking.bike.brandName,
                            style: const TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tên khách hàng: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.booking.customerName!,
                            style: const TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Địa chỉ của khách hàng:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.booking.address,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Số điện thoại: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.booking.customerPhone!,
                            style: const TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Phương thức thanh toán: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Tiền mặt',
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Trạng thái: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.status == 0
                                ? "Chờ giao xe"
                                : "Khách đang thuê",
                            style: const TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tổng cộng",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(
                          widget.booking.price
                                  .round()
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc) +
                              ' đ',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (widget.booking.status == 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(right: 15),
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.deepOrange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Text(
                        "Xác nhận đã giao xe",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
          ],
        ),
      ],
    );
  }
}
