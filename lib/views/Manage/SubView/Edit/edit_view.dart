// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Edit/components/body.dart';

import 'package:flutter/material.dart';

class EditView extends StatelessWidget {
  String fisrtSelectBrand;
  String fisrtSelectType;
  String fisrtSelectYear;
  EditView(
      {Key? key,
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
        title: TopAppBarMain(),
      ),
      body: EditBody(
        selectedBrand: fisrtSelectBrand,
        selectedType: fisrtSelectType,
        selectedYear: fisrtSelectYear,
        selectedStatus: '1',
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "manage"),
      ),
    );
  }
}
