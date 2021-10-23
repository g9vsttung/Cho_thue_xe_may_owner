import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Manage/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageView extends StatelessWidget {
  const ManageView({Key? key}) : super(key: key);

  Future<Map<String, List<Object>>> getData(BuildContext context) async {
    Map<String, List<Object>> list = {};
    await Provider.of<OwnerViewModel>(context, listen: false).getBikes();
    list['bikes'] = Provider.of<OwnerViewModel>(context, listen: false).bikes;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: const TopAppBarMain(),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final List<Bike> bikes =
                  (napshot.data as dynamic)['bikes'] as List<Bike>;
              return ManageBody(
                bikes: bikes,
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
}
