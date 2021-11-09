import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Manage/components/body.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ManageView extends StatelessWidget {
  ManageView({Key? key}) : super(key: key);

  Future<Map<String, List<Object>>> getData(BuildContext context) async {
    Map<String, List<Object>> list = {};
    await Provider.of<OwnerViewModel>(context, listen: false).getBikes();
    list['bikes'] = Provider.of<OwnerViewModel>(context, listen: false).bikes;
    await Provider.of<BrandViewModel>(context, listen: false).getAll();
    list['brands'] = Provider.of<BrandViewModel>(context, listen: false).brands;
    return list;
  }

  int countExit = 0;

  Future<bool> _onWillPop() async {
    countExit++;
    if (countExit != 2) {
      Fluttertoast.showToast(
        msg: "Bấm quay về lần nữa để thoát",
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
      );
      return false;
    } else {
      countExit = 0;
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstants.background,
          title: TopAppBarTitle(
            title: "Xe của bạn",
            hasBack: false,
          ),
        ),
        body: FutureBuilder(
          builder: (context, napshot) {
            if (napshot.connectionState == ConnectionState.done) {
              if (napshot.hasData) {
                final List<Bike> bikes =
                    (napshot.data as dynamic)['bikes'] as List<Bike>;
                final List<Brand> brands =
                    (napshot.data as dynamic)['brands'] as List<Brand>;
                if (bikes.isNotEmpty) {
                  return ManageBody(
                    bikes: bikes,
                    brands: brands,
                  );
                }
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
      ),
    );
  }
}
