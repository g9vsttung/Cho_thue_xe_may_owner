// ignore_for_file: deprecated_member_use

import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Profile/profile_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyEditProfile extends StatefulWidget {
  Owner owner;

  BodyEditProfile({Key? key, required this.owner}) : super(key: key);

  @override
  State<BodyEditProfile> createState() => _BodyEditProfileState();
}

class _BodyEditProfileState extends State<BodyEditProfile> {
  OwnerViewModel ownerViewModel = OwnerViewModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.owner.fullname;
    phoneController.text = widget.owner.phoneNumber;
    addressController.text = widget.owner.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                StringConstants.imageDirectory + "avatar.png",
                width: size.width * 0.2,
              )
            ],
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          const Text(
            "Họ và tên",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.only(left: 10),
            width: double.infinity,
            child: Center(
              child: TextField(
                controller: nameController,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Số điện thoại",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.only(left: 10),
            width: double.infinity,
            // height: size.height*0.3,
            child: Center(
              child: TextField(
                controller: phoneController,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Địa chỉ",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.only(left: 10),
            width: double.infinity,
            child: Center(
              child: TextField(
                controller: addressController,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                await ownerViewModel.updateProfile(nameController.text,
                    phoneController.text, addressController.text);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ProfileView();
                  },
                ));
              },
              color: Colors.orange,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Text(
                "SỬA",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
