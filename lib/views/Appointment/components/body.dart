// ignore_for_file: must_be_immutable, prefer_function_declarations_over_variables

import 'dart:developer';

import 'package:chothuexemay_owner/models/booking_model.dart';
import 'package:chothuexemay_owner/models/booking_transaction.dart';
import 'package:chothuexemay_owner/models/category_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/booking_view_model.dart';
import 'package:chothuexemay_owner/views/AppointmentDetail/appointment_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyAppointment extends StatefulWidget {
  List<Category> categories;
  List<BookingTranstion> bookingOngoing = [];
  List<BookingTranstion> bookingHistory = [];

  BodyAppointment(
      {Key? key,
      required this.bookingHistory,
      required this.bookingOngoing,
      required this.categories})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BodyAppointment();
  }
}

class _BodyAppointment extends State<BodyAppointment> {
  void setData() {
    for (BookingTranstion b in widget.bookingHistory) {
      for (Category c in widget.categories) {
        if (b.bike.categoryId == c.id) {
          b.bike.categoryName = c.name;
        }
      }
    }
    for (BookingTranstion b in widget.bookingOngoing) {
      for (Category c in widget.categories) {
        if (b.bike.categoryId == c.id) {
          b.bike.categoryName = c.name;
        }
      }
    }
  }

  //paging
  bool allLoadedOngoing = false;
  bool allLoadedHistory = false;
  int pageOngoing = 1;
  int pageHistory = 1;
  ScrollController scrollController = ScrollController();

  //cate
  String selectedCate = "renting";

  //Format currency number
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]}.';

  @override
  void initState() {
    setData();
    super.initState();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (selectedCate == "renting") {
          if (allLoadedOngoing) {
            return;
          }
          pageOngoing++;
          log(pageOngoing.toString());
          List<BookingTranstion> listAdd = await loadPage(false, pageOngoing);
          if (listAdd.isEmpty) {
            allLoadedOngoing = true;
          } else {
            setState(() {
              widget.bookingOngoing.addAll(listAdd);
            });
          }
        } else {
          if (allLoadedHistory) {
            return;
          }
          pageHistory++;
          log(pageOngoing.toString());
          List<BookingTranstion> listAdd = await loadPage(true, pageOngoing);
          if (listAdd.isEmpty) {
            allLoadedHistory = true;
          } else {
            setState(() {
              widget.bookingHistory.addAll(listAdd);
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 25),
          color: Colors.white,
          child: cateNavBar(),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: listAppointmentByCate(),
          controller: scrollController,
        )),
      ],
    );
  }

  Widget listAppointmentByCate() {
    if (selectedCate == "renting") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (BookingTranstion booking in widget.bookingOngoing)
            rentDetailBox(booking),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (BookingTranstion booking in widget.bookingHistory)
            rentDetailBox(booking),
        ],
      );
    }
  }

  Widget cateNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (selectedCate == "renting")
          Container(
              padding: const EdgeInsets.only(
                bottom: 2,
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: ColorConstants.textBold,
                width: 3,
              ))),
              child: const Text(
                "Đang cho thuê",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 4,
                ),
              ))
        else
          GestureDetector(
              onTap: () {
                setState(() {
                  selectedCate = "renting";
                });
              },
              child: const Text(
                "Đang cho thuê",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
        if (selectedCate == "history")
          Container(
              padding: const EdgeInsets.only(
                bottom: 2,
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: ColorConstants.textBold,
                width: 3,
              ))),
              child: const Text(
                "Lịch sử cho thuê",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorConstants.textBold,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 4),
              ))
        else
          GestureDetector(
            onTap: () {
              setState(() {
                selectedCate = "history";
              });
            },
            child: const Text("Lịch sử cho thuê",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
      ],
    );
  }

  Widget rentDetailBox(BookingTranstion booking) {
    Color color = Colors.blueAccent;
    String icon = "";
    String status = "";
    if (booking.status == 0) {
      color = Colors.orange;
      icon = "pending.png";
      status = "Chờ nhận xe";
    } else if (booking.status == 1) {
      color = Colors.blueAccent;
      icon = "inProcess.png";
      status = "Đang thuê";
    } else if (booking.status == 2) {
      color = Colors.green;
      icon = "finished.png";
      status = "Hoàn thành";
    } else if (booking.status == 3) {
      color = Colors.red;
      icon = "canceled.png";
      status = "Hủy";
    }
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Image.asset(
                      StringConstants.iconDirectory + icon,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      status,
                      style: TextStyle(fontSize: 16, color: color),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    if (booking.status == 0 || booking.status == 2)
                      Image.asset(
                        StringConstants.iconDirectory + "point.png",
                        width: 3,
                        color: color,
                      ),
                    const SizedBox(
                      width: 7,
                    ),
                    if (booking.status == 0)
                      Text(
                        booking.dateRentActual
                            .toString()
                            .substring(0, 16)
                            .replaceAll('T', ' '),
                        style: TextStyle(fontSize: 16, color: color),
                      ),
                    if (booking.status == 2)
                      Text(
                        booking.dateReturnActual
                            .toString()
                            .substring(0, 16)
                            .replaceAll('T', ' '),
                        style: TextStyle(fontSize: 16, color: color),
                      )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        booking.bike.categoryName,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Image.asset(
                        StringConstants.iconDirectory + "point.png",
                        width: 2,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        booking.bike.modelYear,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Giá: " +
                        booking.price
                            .round()
                            .toString()
                            .replaceAllMapped(reg, mathFunc) +
                        " đ",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AppointmentDetailView(bookingId: booking.id);
                    },
                  ));
                },
                icon: Image.asset(
                  StringConstants.iconDirectory + "detail.png",
                ),
                iconSize: 30,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        getActionButton(booking),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget getActionButton(BookingTranstion booking) {
    MainAxisAlignment ali = MainAxisAlignment.center;
    Size size = MediaQuery.of(context).size;
    double width = size.width;

    return Row(
      mainAxisAlignment: ali,
      children: [
        GestureDetector(
          onTap: () {
            launch("tel://" + booking.customerPhone!);
          },
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            width: width,
            color: Colors.white,
            child: const Center(
              child: Text(
                "Liên hệ",
                style: TextStyle(fontSize: 18, color: ColorConstants.textBold),
              ),
            ),
          ),
        )
      ],
    );
  }

  showMyAlertDialog(Booking booking) {
    Dialog dialog = Dialog(
      child: Container(
        decoration: const BoxDecoration(
          color: ColorConstants.containerBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Đánh giá của bạn",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Rate: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  for (int i = 1; i <= booking.feedback!.rating; i++)
                    Image.asset(
                      StringConstants.iconDirectory + "starRating.png",
                      width: 18,
                    ),
                  for (int i = 1; i <= 5 - booking.feedback!.rating; i++)
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
                booking.feedback!.content,
                style: const TextStyle(fontSize: 16),
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
    // ignore: unused_local_variable
    Future<dynamic> futureValue = showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return dialog;
      },
    );
  }

  Future<List<BookingTranstion>> loadPage(bool status, int page) async {
    List<BookingTranstion> rs = [];
    //1:done - 0:on going
    if (status) {
      rs =
          await Provider.of<BookingTransactionViewModel>(context, listen: false)
              .getHistoryBookingTransactions(page);
    } else {
      rs =
          await Provider.of<BookingTransactionViewModel>(context, listen: false)
              .getOngoingBookingTransactions(page);
    }
    for (BookingTranstion b in rs) {
      for (Category c in widget.categories) {
        if (b.bike.categoryId == c.id) {
          b.bike.categoryName = c.name;
        }
      }
    }
    return rs;
  }
}
