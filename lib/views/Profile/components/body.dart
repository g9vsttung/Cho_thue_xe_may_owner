import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/google_signin_in_view_model.dart';
import 'package:chothuexemay_owner/views/Appointment/appointment_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.owner.fullname,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Số điệnn thoại: " + widget.owner.phoneNumber,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Số dư trong ví: " + widget.balance.toString() + " VND",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    StringConstants.iconDirectory + "edit.png",
                    width: 25,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        getOptionFrame("Lịch đặt của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AppointmentView();
            },
          ));
        }),
        getOptionFrame("Xe của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ManageView();
            },
          ));
        }),
        getOptionFrame("Ví của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return WalletView();
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
        margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18),
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
