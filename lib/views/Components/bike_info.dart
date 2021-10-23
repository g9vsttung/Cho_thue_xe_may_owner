// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace

import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeInfo extends StatelessWidget {
  Bike bike;
  Function() onEdit;
  BikeInfo({Key? key, required this.bike, required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorConstants.containerBackground,
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                        right: 5, top: 10, bottom: 10, left: 10),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: Image.network(
                                    bike.imgPath,
                                    width: size.width * 0.25,
                                    height: size.width * 0.25,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: size.width * 0.45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hãng: ${bike.brandName}",
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Loại xe: ${bike.categoryName}",
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Màu: ${bike.color}",
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Đời xe: ${bike.modelYear}",
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Biển: ${bike.licensePlate}",
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: onEdit,
                              child: Image.asset(
                                StringConstants.iconDirectory + "edit.png",
                                width: size.width * 0.07,
                              ),
                            )
                          ],
                        )
                      ],
                    ))),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
