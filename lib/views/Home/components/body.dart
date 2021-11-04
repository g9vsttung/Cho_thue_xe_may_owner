import 'package:chothuexemay_owner/models/feedback_model.dart';
import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class BodyHome extends StatelessWidget {
  Owner owner;

  BodyHome({required this.owner});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Text(
            "Xin chào, " + owner.fullname,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 1; i <= owner.rating; i++)
                Image.asset(
                  StringConstants.iconDirectory + "starRating.png",
                  width: 18,
                ),
              for (int i = 1; i <= 5 - owner.rating; i++)
                Image.asset(
                  StringConstants.iconDirectory + "starBorder.png",
                  width: 18,
                ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "(" + owner.numberOfRatings.toString() + " đánh giá)",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  "Đánh giá của bạn",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          for (FeedbackModel feedback in owner.feedbacks) feedbackBox(feedback),
        ],
      ),
    );
  }

  Widget feedbackBox(FeedbackModel feedback) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
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
                            child: Image.network(feedback.image!),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feedback.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              feedback.date,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 14),
                            )
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  feedback.content,
                  maxLines: 3,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
