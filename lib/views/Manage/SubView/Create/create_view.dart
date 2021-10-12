// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/components/body.dart';

import 'package:flutter/material.dart';

class CreateView extends StatelessWidget {
  String fisrtSelectBrand;
  String fisrtSelectType;
  String fisrtSelectYear;
  CreateView(
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
      body: CreateBody(
        selectedBrand: fisrtSelectBrand,
        selectedType: fisrtSelectType,
        selectedYear: fisrtSelectYear,
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "manage"),
      ),
    );
  }
}
