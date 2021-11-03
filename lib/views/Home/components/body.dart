import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BodyHome extends StatelessWidget {
  Owner owner = Owner(
      id: "1",
      phoneNumber: "123456789",
      fullname: "NVA",
      address: "sadsad",
      numberOfbikes: 13,
      rating: 4.5,
      numberOfRatings: 42,
      areaId: "rwerw",
      status: 1,
      adminId: "sasd",
      banTimes: 0,
      mail: "th",
      feedbacks: [
        FeedbackModel(
            id: "1", content: "Chất lượng tốt", rating: 4.3, date: "20/11/2021")
      ],
      balance: 120000);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Xin chào, " + owner.fullname,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
