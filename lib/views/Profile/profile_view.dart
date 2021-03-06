import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
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
            title: "Cá nhân",
            hasBack: false,
          ),
        ),
        body: FutureBuilder(
          builder: (context, napshot) {
            if (napshot.connectionState == ConnectionState.done) {
              if (napshot.hasData) {
                final owner = (napshot.data as dynamic)['profile'] as Owner;
                final wallet = (napshot.data as dynamic)['wallet'] as Wallet;
                return BodyProfile(
                  owner: owner,
                  balance: wallet.balance,
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: getData(context),
        ),
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: BottomAppBar(
          color: ColorConstants.background,
          child: BottomBar(selected: "profile"),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};
    list['wallet'] =
        await Provider.of<OwnerViewModel>(context, listen: false).getWallet();
    list['profile'] =
        await Provider.of<OwnerViewModel>(context, listen: false).viewProfile();

    return list;
  }
}
