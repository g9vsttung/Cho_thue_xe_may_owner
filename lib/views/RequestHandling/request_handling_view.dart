import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/RequestHandling/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestHandlingView extends StatelessWidget {
  OrderModel order;

  RequestHandlingView({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: Center(
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
