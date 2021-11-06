// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/bike_view_model.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Edit/components/body.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditView extends StatelessWidget {
  String bikeId;
  String fisrtSelectBrand;
  String fisrtSelectType;
  String fisrtSelectYear;
  EditView(
      {Key? key,
      required this.bikeId,
      required this.fisrtSelectBrand,
      required this.fisrtSelectType,
      required this.fisrtSelectYear})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(title: "Sửa thông tin xe"),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final Bike bike = napshot.data as Bike;
              return EditBody(
                bike: bike,
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "manage"),
      ),
    );
  }

  Future<Bike> getData(BuildContext context) async {
    return await Provider.of<BikeViewModel>(context, listen: false)
        .getById(bikeId);
  }
}
