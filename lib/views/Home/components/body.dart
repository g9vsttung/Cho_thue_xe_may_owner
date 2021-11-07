import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class BodyHome extends StatelessWidget {
  Owner owner;
  List<FeedbackModel> feedbacks;
  BodyHome({Key? key, required this.owner, required this.feedbacks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Text(
            "Xin chào, " + owner.fullname,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 1; i <= owner.rating.round(); i++)
                Image.asset(
                  StringConstants.iconDirectory + "starRating.png",
                  width: 18,
                ),
              for (int i = 1; i <= 5 - owner.rating.round(); i++)
                Image.asset(
                  StringConstants.iconDirectory + "starBorder.png",
                  width: 18,
                ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "(" + owner.numberOfRatings.toString() + " đánh giá)",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: const [
                Text(
                  "Đánh giá của bạn",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          for (FeedbackModel feedback in feedbacks) feedbackBox(feedback),
        ],
      ),
    );
  }

  Widget feedbackBox(FeedbackModel feedback) {
    if (feedback.rating != 0) {
      return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: ColorConstants.containerBackground,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 16.0,
                            child: ClipRRect(
                              child: Image.asset(
                                  StringConstants.iconDirectory + 'user.jpg'),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feedback.customerName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 1; i <= feedback.rating; i++)
                            Image.asset(
                              StringConstants.iconDirectory + "starRating.png",
                              width: 18,
                            ),
                          for (int i = 1; i <= 5 - feedback.rating; i++)
                            Image.asset(
                              StringConstants.iconDirectory + "starBorder.png",
                              width: 18,
                            ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        feedback.content,
                        maxLines: 3,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      );
    }
    return Container();
  }
}
