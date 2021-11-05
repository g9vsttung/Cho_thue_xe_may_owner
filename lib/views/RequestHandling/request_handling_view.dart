// ignore_for_file: must_be_immutable

import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/RequestHandling/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestHandlingView extends StatelessWidget {
  OrderModel order;

  RequestHandlingView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: const Center(
            child: Text(
          "Bạn có yêu cầu thuê xe",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        )),
      ),
      body: BodyRequestHandling(
        order: order,
      ),
    );
  }
}
