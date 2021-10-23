// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/RequestHandling/request_handling_view.dart';
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
    _fcm.getToken().then((token) {
      print("++++++++++++++" + token! + "+++++++++++++++++");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage evt) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return RequestHandlingView(
            order: OrderModel.jsonFromByDate(evt.data["json"]),
          );
        },
      ));
    });
    FirebaseMessaging.onBackgroundMessage((evt) async {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return RequestHandlingView(
            order: OrderModel.jsonFromByDate(evt.data["json"]),
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
