// ignore_for_file: must_be_immutable, prefer_function_declarations_over_variables, deprecated_member_use

import 'package:chothuexemay_owner/models/history_wallet_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Recharge/recharge_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyWallet extends StatefulWidget {
  Wallet wallet;
  List<TransactionHistory> transactions;
  BodyWallet({Key? key, required this.wallet, required this.transactions})
      : super(key: key);

  @override
  State<BodyWallet> createState() => _BodyWalletState();
}

class _BodyWalletState extends State<BodyWallet> {
  List<TransactionHistory> showList = [];
  int page = 1;
  bool allLoaded = false;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    showList = widget.transactions;
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (allLoaded) {
          return;
        }
        page++;
        List<TransactionHistory> listAdd = await loadPage(page);

        if (listAdd.isEmpty) {
          allLoaded = true;
        } else {
          setState(() {
            showList.addAll(listAdd);
          });
        }
      }
    });
  }

  Future<List<TransactionHistory>> loadPage(int page) async {
    return await Provider.of<OwnerViewModel>(context, listen: false)
        .getWalletTransactions(page);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          walletBox(size, context),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.075,
                right: size.width * 0.074,
                top: 20,
                bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lịch sử giao dịch",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showMyAlertDialog(size, context);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: ColorConstants.containerBoldBackground),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              StringConstants.iconDirectory + "filter.png",
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Bộ lọc",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (showList.isNotEmpty)
            for (TransactionHistory trans in showList)
              transactionHistory(trans, size),
          if (showList.isEmpty) const Text('Chưa có giao dịch nào'),
        ],
      ),
    );
  }

  Widget walletBox(Size size, BuildContext context) {
    //Format currency number
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]}.';
    return Container(
      width: size.width * 0.85,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: ColorConstants.containerBackground,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Số dư",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.wallet.balance
                      .round()
                      .toString()
                      .replaceAllMapped(reg, mathFunc),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  " VND",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ]),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: size.width * 0.85 - 7 * 2,
            height: 1,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return RechargeView(balance: widget.wallet.balance);
                    },
                  ));
                },
                child: Container(
                  width: size.width * 0.35,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        StringConstants.iconDirectory + "recharge.png",
                        width: size.width * 0.1,
                      ),
                      const Text(
                        "Nạp tiền",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: size.width * 0.35,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          StringConstants.iconDirectory + "withdraw.png",
                          width: size.width * 0.1,
                        ),
                        const Text(
                          "Rút tiền",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget transactionHistory(TransactionHistory trans, Size size) {
    //Format currency number
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]}.';

    String text = "";
    if (trans.action) {
      if (trans.bookingId.isEmpty) {
        text = "Rút tiền từ tài khoản";
      } else {
        text = "Trả chi phí";
      }
    } else {
      text = "Nạp tiền vào tài khoản";
    }
    Color color = Colors.white;
    String beforeAmount = "";
    if (trans.action) {
      color = Colors.red;
      beforeAmount = "-";
    } else {
      color = Colors.green;
      beforeAmount = "+";
    }
    return Column(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.all(10),
          color: ColorConstants.containerBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "ID: " + trans.id.substring(0, 14) + '...',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    beforeAmount +
                        trans.amount
                            .round()
                            .toString()
                            .replaceAllMapped(reg, mathFunc) +
                        " VND",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    trans.date.toString().substring(0, 16).replaceAll('T', ' '),
                    style: const TextStyle(
                        fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        )
      ],
    );
  }

  List<TransactionHistory> filterTransactions(bool action) {
    List<TransactionHistory> rs = [];
    for (TransactionHistory transaction in widget.transactions) {
      if (transaction.action == action) {
        rs.add(transaction);
      }
    }
    return rs;
  }

  showMyAlertDialog(Size size, BuildContext context) {
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
                "Chọn bộ lọc",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "nap");
                },
                color: ColorConstants.containerBoldBackground,
                child: const Text("Nguồn thu"),
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "rut");
                },
                color: ColorConstants.containerBoldBackground,
                child: const Text("Nguồn chi"),
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "all");
                },
                color: ColorConstants.containerBoldBackground,
                child: const Text("Tất cả"),
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
    ).then((value) {
      if (value == "all") {
        setState(() {
          showList = widget.transactions;
        });
      } else {
        bool action = true;
        if (value == "nap") {
          action = false;
        }
        setState(() {
          showList = filterTransactions(action);
        });
      }
    });
  }
}
