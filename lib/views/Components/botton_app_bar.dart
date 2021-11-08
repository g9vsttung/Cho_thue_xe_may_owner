// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Appointment/appointment_view.dart';
import 'package:chothuexemay_owner/views/Home/home_view.dart';
import 'package:chothuexemay_owner/views/Manage/manage_view.dart';
import 'package:chothuexemay_owner/views/Profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  String selected = "";

  BottomBar({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (selected == "home")
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/home.png",
                    color: ColorConstants.selectedIcon,
                    width: 30,
                  ),
                  Text(
                    "Trang chủ",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/home.png",
                    color: ColorConstants.normalIcon,
                    width: 30,
                  ),
                  Text(
                    "Trang chủ",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
          if (selected == "order")
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AppointmentView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/order.png",
                    color: ColorConstants.selectedIcon,
                    width: 30,
                  ),
                  Text(
                    "Đơn đặt",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AppointmentView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/order.png",
                    color: ColorConstants.normalIcon,
                    width: 30,
                  ),
                  Text(
                    "Đơn đặt",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
          if (selected == "manage")
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ManageView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/manageBike.png",
                    color: ColorConstants.selectedIcon,
                    width: 27,
                  ),
                  Text(
                    "Quản lí xe",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ManageView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/manageBike.png",
                    color: ColorConstants.normalIcon,
                    width: 27,
                  ),
                  Text(
                    "Quản lí xe",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
          if (selected == "profile")
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProfileView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/profile.png",
                    color: ColorConstants.selectedIcon,
                    width: 30,
                  ),
                  Text(
                    "Cá nhân",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProfileView();
                  },
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/profile.png",
                    color: ColorConstants.normalIcon,
                    width: 30,
                  ),
                  Text(
                    "Cá nhân",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
