import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/AppointmentDetail/components/body.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppointmentDetailView extends StatelessWidget {
  BookingTranstion booking;

  AppointmentDetailView({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(title: "Thông tin đơn"),
      ),
      body: BodyAppointmentDetail(booking: booking),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "order"),
      ),
    );
  }
}
