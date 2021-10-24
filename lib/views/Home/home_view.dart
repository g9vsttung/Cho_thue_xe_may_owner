// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/services/firebase_database.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/RequestHandling/request_handling_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    final FirebaseDatabaseCustom fb = FirebaseDatabaseCustom();
    _fcm.getToken().then((token) async {
      await fb.updateTokenFCM(token!);
      print("++++++++++++++" + token!);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage evt) {
      final data = jsonDecode(evt.data["json"]);
      OrderModel order = OrderModel(
          licensePlate: data["LicensePlate"],
          dateRent: data["DateRent"],
          bikeName: data["CateName"],
          bikeImage: ImageConstants.getFullImagePath(data["ImgPath"]),
          address: data["Address"],
          price: data["Price"],
          dateReturn: data["DateReturn"]);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return RequestHandlingView(
            order: order,
          );
        },
      ));
    });
    FirebaseMessaging.onBackgroundMessage((evt) async {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return RequestHandlingView(
            order: OrderModel.jsonFromByHour(jsonDecode(evt.data["json"])),
          );
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarMain(),
      ),
      body: Center(
        child: Text("Login Success"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }
}
