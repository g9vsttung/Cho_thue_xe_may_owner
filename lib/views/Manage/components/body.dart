// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:chothuexemay_owner/models/bike_model_fake.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/bike_info.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/create_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageBody extends StatelessWidget {
  List<BikeFake> list = [
    BikeFake("yamahaEx.png", "Yamaha", "Exciter", "blue", 2020, "17AB-SD45"),
    BikeFake("yamahaEx.png", "Yamaha", "Exciter", "blue", 2020, "17AB-SD45"),
    BikeFake("yamahaEx.png", "Yamaha", "Exciter", "blue", 2020, "17AB-SD45"),
    BikeFake("yamahaEx.png", "Yamaha", "Exciter", "blue", 2020, "17AB-SD45"),
    BikeFake("yamahaEx.png", "Yamaha", "Exciter", "blue", 2020, "17AB-SD45"),
    BikeFake("yamahaEx.png", "Yamaha", "Exciter", "blue", 2020, "17AB-SD45")
  ];

  ManageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bảng giá",
              style: TextStyle(
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CreateView();
                    },
                  ));
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  "+ Thêm xe",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Xe của bạn",
              style: TextStyle(
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            for (BikeFake bike in list)
              BikeInfo(
                  image: bike.image,
                  brand: bike.brand,
                  name: bike.name,
                  color: bike.color,
                  year: bike.year,
                  bienSo: bike.licensePlate),
          ],
        ),
      ),
    );
  }
}
