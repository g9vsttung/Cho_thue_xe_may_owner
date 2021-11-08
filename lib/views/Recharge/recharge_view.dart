import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

// ignore: must_be_immutable
class RechargeView extends StatelessWidget {
  double balance;

  RechargeView({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Nạp tiền",
        ),
      ),
      body: BodyRecharge(
        balance: balance,
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
