// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/models/order_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/feedback_view_model.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_owner/views/Home/components/body.dart';
import 'package:chothuexemay_owner/views/RequestHandling/request_handling_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners(context);
  }

  Future firebaseCloudMessaging_Listeners(BuildContext context) async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    _fcm.getToken().then((token) async {
      log('Got Firebase Token!');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage evt) {
      doNotiAction(evt);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage evt) {
      doNotiAction(evt);
    });
    //
  }

  doNotiAction(RemoteMessage evt) {
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
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return RequestHandlingView(
          order: order,
        );
      },
    ), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Trang chủ",
          hasBack: false,
        ),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final owner = (napshot.data as dynamic)['owner'] as Owner;
              final feedbacks =
                  (napshot.data as dynamic)['feedbacks'] as List<FeedbackModel>;
              return BodyHome(
                owner: owner,
                feedbacks: feedbacks,
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};
    list['owner'] =
        await Provider.of<OwnerViewModel>(context, listen: false).viewProfile();
    list['feedbacks'] =
        await Provider.of<FeedbackViewModel>(context, listen: false)
            .getFeebackByPage(1);

    return list;
  }
}
