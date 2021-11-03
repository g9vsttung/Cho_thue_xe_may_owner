import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class WalletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Ví tiền",
        ),
      ),
      body: BodyWallet(),
      backgroundColor: Colors.grey[200],
    );
  }
}
