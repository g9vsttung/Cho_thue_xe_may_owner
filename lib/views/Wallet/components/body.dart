import 'package:chothuexemay_owner/models/history_wallet_model.dart';
import 'package:chothuexemay_owner/models/wallet_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Recharge/recharge_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyWallet extends StatelessWidget {
  Wallet wallet;

  BodyWallet({Key? key, required this.wallet}) : super(key: key);

  // Wallet wallet = Wallet.general(balance: 120000, history: [
  //   TransactionHistory(
  //       action: true, amount: 100000, date: DateTime.now(), id: "ASDDAS"),
  //   TransactionHistory(
  //       action: false, amount: 50000, date: DateTime.now(), id: "ASDDAS"),
  //   TransactionHistory(
  //       action: false, amount: 20000, date: DateTime.now(), id: "ASDDAS"),
  //   TransactionHistory(
  //       action: true, amount: 120000, date: DateTime.now(), id: "ASDDAS"),
  //   TransactionHistory(
  //       action: true, amount: 30000, date: DateTime.now(), id: "ASDDAS"),
  //   TransactionHistory(
  //       action: true, amount: 350000, date: DateTime.now(), id: "ASDDAS"),
  //   TransactionHistory(
  //       action: false, amount: 100000, date: DateTime.now(), id: "ASDDAS"),
  //   TransactionHistory(
  //       action: true, amount: 130000, date: DateTime.now(), id: "ASDDAS"),
  // ]);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          walletBox(size, context),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.075,
                right: size.width * 0.074,
                top: 20,
                bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lịch sử giao dịch",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Lọc",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      StringConstants.iconDirectory + "filter.png",
                      width: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
          for (TransactionHistory trans in wallet.history!)
            transactionHistory(trans, size),
        ],
      ),
    );
  }

  Widget walletBox(Size size, BuildContext context) {
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
                  wallet.balance.round().toString(),
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
                      return RechargeView(balance: wallet.balance);
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
              Container(
                width: size.width * 0.35,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      StringConstants.iconDirectory + "withdraw.png",
                      width: size.width * 0.1,
                    ),
                    const Text(
                      "Rút tiền",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget transactionHistory(TransactionHistory trans, Size size) {
    String text =
        trans.action ? "Rút tiền từ tài khoản" : "Nạp tiền vào tài khoản";
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
                    "ID: " + trans.id,
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
                    beforeAmount + trans.amount.round().toString() + " VND",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    trans.date.toString().split(" ")[0],
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
}