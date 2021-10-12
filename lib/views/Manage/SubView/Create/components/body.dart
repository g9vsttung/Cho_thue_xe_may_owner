// ignore_for_file: must_be_immutable

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/components/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CreateBody extends StatefulWidget {
  String selectedBrand;
  String selectedYear;
  String selectedType;
  CreateBody(
      {Key? key,
      required this.selectedBrand,
      required this.selectedYear,
      required this.selectedType})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CreateBody();
  }
}

class _CreateBody extends State<CreateBody> {
  TextEditingController colorController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              const Center(
                child: Text(
                  "THÊM XE MỚI",
                  style: TextStyle(
                    color: ColorConstants.textBold,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: size.width * 0.8,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.black54))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Center(
                child: SizedBox(
                  height: 35,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      //Thêm ảnh ở đây
                    },
                    color: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Text(
                      "Thêm ảnh",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "anh_ma_an_chon_.PNG",
                  style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: size.width * 0.1),
            height: size.height * 0.6,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Hãng",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      "Loại xe",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      "Đời xe",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      "Màu",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      "Biển số",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropDownCreate(
                      categoryDropDown: "Brand",
                      dropDownValue: widget.selectedBrand,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedBrand = value;
                          widget.selectedType = "";
                        });
                      },
                    ),
                    DropDownCreate(
                      categoryDropDown: "Type",
                      dropDownValue: widget.selectedType,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedType = value;
                        });
                      },
                      brand: widget.selectedBrand,
                    ),
                    DropDownCreate(
                      categoryDropDown: "Year",
                      dropDownValue: widget.selectedYear,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedYear = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      height: 35,
                      child: TextField(
                        controller: colorController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                              fontSize: 14),
                          hintText: "Đỏ vàng",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      height: 35,
                      child: TextField(
                        controller: licensePlateController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                              fontSize: 14),
                          hintText: "59-AA 999.99",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.red,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {},
                child: const Text(
                  "Hủy",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.orange,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {},
                child: const Text(
                  "Đồng ý",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
