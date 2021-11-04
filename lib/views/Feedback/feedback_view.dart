import 'package:chothuexemay_owner/models/booking_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Components/app_bar.dart';
import 'package:chothuexemay_owner/views/Feedback/components/body.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  Booking booking;

  FeedbackView({required this.booking});

  @override
  Widget build(BuildContext context) {
    String title = "Feedback";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Đánh giá",
        ),
      ),
      body: BodyFeedback(
        booking: booking,
      ),
    );
  }
}
