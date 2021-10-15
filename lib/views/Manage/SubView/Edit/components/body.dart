// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/components/dropdown.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Edit/components/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditBody extends StatefulWidget {
  String selectedBrand;
  String selectedYear;

  String selectedType;
  String selectedStatus;

  EditBody(
      {Key? key,
      required this.selectedBrand,
      required this.selectedYear,
      required this.selectedType,
      required this.selectedStatus})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _EditBody();
  }
}

class _EditBody extends State<EditBody> {

  TextEditingController colorController = TextEditingController(text: "Màu xe (line 35)");
  TextEditingController licensePlateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
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
                  "SỬA THÔNG TIN XE",
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
                      "Sửa ảnh",
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
                      "Trang thái",
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
                    DropDownManage(
                      categoryDropDown: "Brand",
                      brands: _brandViewModel.brands,
                      dropDownValue: widget.selectedBrand,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedBrand = value;
                          widget.selectedType = "";
                        });
                      },
                    ),
                    DropDownManage(
                      brands: _brandViewModel.brands,
                      categoryDropDown: "Type",
                      dropDownValue: widget.selectedType,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedType = value;
                        });
                      },
                      brand: widget.selectedBrand,
                    ),
                    DropDownManage(
                      brands: _brandViewModel.brands,
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
                    DropDownStatus(
                      dropDownValue: widget.selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedStatus = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Biển số của xe",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),)
                        ],
                      )
                    ),



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
                onPressed: () {
                  showMyAlertDialog();
                },
                child: const Text(
                  "Xóa",
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
                  "Sửa",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              )
            ],
          ),SizedBox(height: 30,)
        ],
      ),
    );
  }
  showMyAlertDialog() {
      Dialog dialog = Dialog(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Bạn có chắc muốn xóa không?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.black38,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Hủy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: (){

                    },
                    child: Text("Xóa",
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
        ),
        backgroundColor: Colors.white,
      );
      Future<dynamic> futureValue = showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return dialog;
        },
      );
    }
}
