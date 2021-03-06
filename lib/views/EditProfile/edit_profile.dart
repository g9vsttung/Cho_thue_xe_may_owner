// ignore_for_file: must_be_immutable

import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/EditProfile/components/body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  Owner owner;

  EditProfileView({Key? key, required this.owner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Sửa thông tin",
        ),
      ),
      body: BodyEditProfile(owner: owner),
    );
  }
}
