// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar_main.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Home/components/body.dart';
import 'package:chothuexemay_owner/views/RequestHandling/request_handling_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

Future firebaseCloudMessaging_Listeners(BuildContext context) async {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  _fcm.getToken().then((token) async {
    log('Got Firebase Token!');
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage evt) {
    final data = jsonDecode(evt.data["json"]);
    OrderModel order = OrderModel(
        licensePlate: data["LicensePlate"],
        dateRent: data["DateRent"],
        bikeName: data["CateName"],
        customerId: data['CustomerId'],
        bikeImage: ImageConstants.getFullImagePath(
            data["ImgPath"] ?? ImageConstants.DEFAULT_IMG_NAME),
        address: data["Address"],
        customerName: data["CustomerName"],
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

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarMain(),
      ),
      body: BodyHome(
          owner: Owner(
              id: "id",
              phoneNumber: "phoneNumber",
              fullname: "fullname",
              address: "address",
              numberOfbikes: 1,
              rating: 3,
              numberOfRatings: 42,
              areaId: "areaId",
              status: 0,
              adminId: "adminId",
              banTimes: 0,
              mail: "mail",
              feedbacks: [
            FeedbackModel(
                content: "contentasdasdasdasdsadas asdasd sadasd asdasd asdas",
                rating: 4,
                date: "20/10/2021",
                image: "https://www.w3schools.com/howto/img_avatar.png",
                name: "Tung Vu"),
            FeedbackModel(
                content: "",
                rating: 3,
                date: "20/10/2021",
                image: "https://www.w3schools.com/howto/img_avatar.png",
                name: "Tung Vu"),
            FeedbackModel(
                content: "contentasdasdasdasdsadas asdasd sadasd asdasd asdas",
                rating: 5,
                date: "20/10/2021",
                image: "https://www.w3schools.com/howto/img_avatar.png",
                name: "Tung Vu"),
            FeedbackModel(
                content: "contentasdasdasdasdsadas asdasd sadasd asdasd asdas",
                rating: 4,
                date: "20/10/2021",
                image: "https://www.w3schools.com/howto/img_avatar.png",
                name: "Tung Vu"),
            FeedbackModel(
                content: "contentasdasdasdasdsadas asdasd sadasd asdasd asdas",
                rating: 4,
                date: "20/10/2021",
                image: "https://www.w3schools.com/howto/img_avatar.png",
                name: "Tung Vu"),
          ])),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }
}
