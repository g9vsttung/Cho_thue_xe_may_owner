// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Manage/manage_view.dart';
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
          //=============================================================SEARCH
          if (selected == "search")
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/search.png",
                    color: ColorConstants.selectedIcon,
                    width: 30,
                  ),
                  Text(
                    "Tìm Kiếm",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/search.png",
                    color: ColorConstants.normalIcon,
                    width: 30,
                  ),
                  Text(
                    "Tìm kiếm",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
          //=============================================MANAGE
          if (selected == "manage")
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ManageView();
                },));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/manageBike.png",
                    color: ColorConstants.selectedIcon,
                    width: 30,
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ManageView();
                },));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/manageBike.png",
                    color: ColorConstants.normalIcon,
                    width: 30,
                  ),
                  Text(
                    "Quản lí xe",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
          //================================================PROFILE
          if (selected == "profile")
            GestureDetector(
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