// ignore_for_file: must_be_immutable, prefer_function_declarations_over_variables

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BodyRecharge extends StatefulWidget {
  double balance;

  BodyRecharge({Key? key, required this.balance}) : super(key: key);

  @override
  State<BodyRecharge> createState() => _BodyRechargeState();
}

class _BodyRechargeState extends State<BodyRecharge> {
  TextEditingController controller = TextEditingController();

  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    //Format currency number
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]}.';

    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size.width,
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Số dư tài khoản",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.balance
                            .round()
                            .toString()
                            .replaceAllMapped(reg, mathFunc),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " VND",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  color: ColorConstants.containerBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              padding: const EdgeInsets.only(
                  top: 25, bottom: 25, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Nhập số tiền muốn nạp",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.65,
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            hintText: "Số tiền (VND)",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const Text("VND")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Hoặc chọn nhanh số tiền",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      amountBox(100000, size),
                      amountBox(200000, size),
                      amountBox(500000, size),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      amountBox(1000000, size),
                      amountBox(2000000, size),
                      amountBox(5000000, size),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          width: size.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 25),
          child: const Center(
            child: Text(
              "Thanh toán qua PayPal",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget amountBox(int amount, Size size) {
    //Format currency number
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]}.';

    Color? color = Colors.white;
    if (selectedAmount == amount) {
      color = Colors.blue[200];
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
        });
      },
      child: Container(
        width: size.width * 0.27,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.grey, width: 1)),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
          child: Text(
            amount.toString().replaceAllMapped(reg, mathFunc) + " VND",
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
