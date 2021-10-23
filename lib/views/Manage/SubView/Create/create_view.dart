// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/components/body.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateView extends StatelessWidget {
  const CreateView({
    Key? key,
  }) : super(key: key);

  Future<Map<String, List<Object>>> getData(BuildContext context) async {
    Map<String, List<Object>> list = {};
    await Provider.of<BrandViewModel>(context, listen: false).getAll();
    list['brands'] = Provider.of<BrandViewModel>(context, listen: false).brands;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarMain(),
      ),
      body: FutureBuilder(
          builder: (context, napshot) {
            if (napshot.connectionState == ConnectionState.done) {
              if (napshot.hasData) {
                final List<Brand> brands =
                    (napshot.data as dynamic)['brands'] as List<Brand>;
                return CreateBody(
                  brands: brands,
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          future: getData(context)),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "manage"),
      ),
    );
  }
}
