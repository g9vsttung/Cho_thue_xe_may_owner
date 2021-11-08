// ignore_for_file: must_be_immutable, prefer_function_declarations_over_variables

import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/google_signin_in_view_model.dart';
import 'package:chothuexemay_owner/views/Appointment/appointment_view.dart';
import 'package:chothuexemay_owner/views/EditProfile/edit_profile.dart';
import 'package:chothuexemay_owner/views/Manage/manage_view.dart';
import 'package:chothuexemay_owner/views/Wallet/wallet_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyProfile extends StatefulWidget {
  Owner owner;
  double balance;
  BodyProfile({Key? key, required this.owner, required this.balance})
      : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  //Format currency number
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]}.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    StringConstants.imageDirectory + "avatar.png",
                    width: 65,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.owner.fullname,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Số điện thoại: " + widget.owner.phoneNumber,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Số dư trong ví: " +
                            widget.balance
                                .toString()
                                .replaceAllMapped(reg, mathFunc) +
                            " VND",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return EditProfileView(owner: widget.owner);
                      },
                    ));
                  },
                  icon: Image.asset(
                    StringConstants.iconDirectory + "edit.png",
                    width: 25,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        getOptionFrame("Lịch đặt của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AppointmentView();
            },
          ));
        }),
        getOptionFrame("Xe của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ManageView();
            },
          ));
        }),
        getOptionFrame("Ví của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const WalletView();
            },
          ));
        }),
        getOptionFrame("Đăng xuất", () {
          GoogleSignInViewModel _ggle = GoogleSignInViewModel();
          _ggle.signOut(context: context);
        }),
      ],
    );
  }

  Widget getOptionFrame(String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            Image.asset(
              StringConstants.iconDirectory + "detail.png",
              color: Colors.grey,
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
