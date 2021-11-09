// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/bike_info.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/create_view.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Edit/edit_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageBody extends StatefulWidget {
  List<Bike> bikes;
  List<Brand> brands;
  ManageBody({Key? key, required this.bikes, required this.brands})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ManageBody();
  }
}

class _ManageBody extends State<ManageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // ignore: deprecated_member_use
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
            if (widget.bikes.isNotEmpty)
              for (Bike bike in widget.bikes)
                getBikeInfo(bike, widget.brands[0]),
            if (widget.bikes.isEmpty)
              const Center(
                child: Text("Hiện bạn chưa có chiếc xe nào"),
              )
          ],
        ),
      ),
    );
  }

  Widget getBikeInfo(Bike bike, Brand brand) {
    if (bike.status == 0 || bike.status == 4) {
      return BikeInfo(
        bike: bike,
        onEdit: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              String value = brand.id;
              String type = brand.categories[0].id;
              String bikeId = bike.id;
              return EditView(
                  bikeId: bikeId,
                  fisrtSelectBrand: value,
                  fisrtSelectType: type,
                  fisrtSelectYear: "2018");
            },
          ));
        },
      );
    }
    return Container();
  }
}
