// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';

import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/bike_view_model.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/components/dropdown.dart';
import 'package:chothuexemay_owner/views/Manage/manage_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateBody extends StatefulWidget {
  List<Brand> brands;
  String? selectedBrand;
  String selectedYear = StringConstants.YEAR_DROPDOWN_START.toString();
  String? selectedType;

  CreateBody({
    Key? key,
    required this.brands,
  }) : super(key: key);

  void init() {
    selectedBrand = brands[0].id;
    selectedType = brands[0].categories[0].id;
  }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    init();
    return _CreateBody();
  }
}

class _CreateBody extends State<CreateBody> {
  File? _imageFile;
  String _imagePath = "";

  _CreateBody();

  final BikeViewModel _bikeViewModel = BikeViewModel();
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
                      pickImage();
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
              Center(
                child: Text(
                  _imagePath,
                  style: const TextStyle(
                      fontSize: 10, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          previewImage(size),
          Container(
            padding: EdgeInsets.only(left: size.width * 0.1),
            height: size.height * 0.5,
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
                    DropDownManage(
                      categoryDropDown: "Brand",
                      dropDownValue: widget.selectedBrand!,
                      brands: widget.brands,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedBrand = value;
                          widget.selectedType = "";
                        });
                      },
                    ),
                    DropDownManage(
                      categoryDropDown: "Type",
                      dropDownValue: widget.selectedType!,
                      brands: widget.brands,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedType = value;
                        });
                      },
                      brand: widget.selectedBrand,
                    ),
                    DropDownManage(
                      categoryDropDown: "Year",
                      dropDownValue: widget.selectedYear,
                      brands: widget.brands,
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ManageView();
                    },
                  ));
                },
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
                onPressed: () async {
                  Bike bike = Bike.createBike(
                      licensePlateController.text.replaceAll(' ', ''),
                      colorController.text,
                      widget.selectedYear,
                      widget.selectedType!,
                      _imageFile);
                  int statusCode = await _bikeViewModel.createNewBike(bike);

                  if (statusCode == 200) {
                    Fluttertoast.showToast(
                      msg: "Thêm xe thành công.",
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  } else if (statusCode == 422) {
                    Fluttertoast.showToast(
                      msg: "Biển số đã có trong hệ thống",
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Thêm xe thất bại! Xin hãy thử lại sau.",
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  }

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => ManageView()),
                    (route) => false,
                  );
                },
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

  Widget previewImage(Size size) {
    if (_imageFile != null) {
      return Image.file(_imageFile!,
          fit: BoxFit.fill, height: size.height * 0.2, width: size.width * 0.7);
    }
    return Container();
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imagePath = pickedFile.name.toString();
        int _length = _imagePath.length;

        _imagePath = _imagePath.substring(0, 8) +
            '...' +
            _imagePath.substring(_length - 7, _length);
        log('Image Path $_imagePath');
      }
    });
  }
}
