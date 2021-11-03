// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/bike_view_model.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/components/dropdown.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Edit/components/dropdown.dart';
import 'package:chothuexemay_owner/views/Manage/manage_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditBody extends StatefulWidget {
  Bike bike;

  EditBody({Key? key, required this.bike}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditBody();
  }
}

class _EditBody extends State<EditBody> {
  final TextEditingController colorController = TextEditingController();
  final BikeViewModel _bikeViewModel = BikeViewModel();
  Bike? _deleteBike;
  File? _imageFile;
  String _imagePath = "";

  @override
  void initState() {
    colorController.text = widget.bike.color;
    _deleteBike = Bike.deleteBike(widget.bike.id, widget.bike.imgFile);
    super.initState();
  }

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
                    onPressed: () async {
                      //Thêm ảnh ở đây
                      await pickImage();
                    },
                    color: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Text(
                      "Cập nhật ảnh",
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
          SizedBox(
            height: 15,
          ),
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
                      dropDownValue: widget.bike.brandId,
                      onChanged: (value) {
                        setState(() {
                          widget.bike.brandId = value;
                          widget.bike.categoryId = "";
                        });
                      },
                    ),
                    DropDownManage(
                      brands: _brandViewModel.brands,
                      categoryDropDown: "Type",
                      dropDownValue: widget.bike.categoryId,
                      brand: widget.bike.brandId,
                      onChanged: (value) {
                        setState(() {
                          widget.bike.categoryId = value;
                        });
                      },
                      //brand: widget.bike.,
                    ),
                    DropDownManage(
                      brands: _brandViewModel.brands,
                      categoryDropDown: "Year",
                      dropDownValue: widget.bike.modelYear,
                      onChanged: (value) {
                        setState(() {
                          widget.bike.modelYear = value;
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
                      dropDownValue: widget.bike.status.toString(),
                      onChanged: (value) {
                        setState(() {
                          widget.bike.status = int.parse(value);
                        });
                      },
                    ),
                    SizedBox(
                        width: size.width * 0.4,
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.bike.licensePlate.toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            )
                          ],
                        )),
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
                onPressed: () async {
                  Bike bike = Bike.updateBike(
                      widget.bike.id,
                      widget.bike.licensePlate,
                      colorController.text,
                      widget.bike.modelYear,
                      widget.bike.categoryId,
                      widget.bike.status,
                      _imageFile,
                      widget.bike.imgFile);
                  bool isSuccess = await _bikeViewModel.updateBike(bike);
                  if (isSuccess) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ManageView();
                      },
                    ));
                  } else {
                    //Edit failed
                  }
                },
                child: const Text(
                  "Sửa",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  showMyAlertDialog() {
    Dialog dialog = Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Text(
                "Bạn có chắc muốn xóa không?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  color: Colors.black38,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Hủy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () async {
                    bool isSuccess =
                        await _bikeViewModel.deleteBike(_deleteBike!);
                    if (isSuccess) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ManageView();
                        },
                      ));
                    } else {
                      //Delete failed
                    }
                  },
                  child: const Text(
                    "Xóa",
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

  Widget previewImage(Size size) {
    if (_imageFile != null) {
      return Image.file(_imageFile!,
          fit: BoxFit.fill, height: size.height * 0.2, width: size.width * 0.8);
    }
    return Image.network(widget.bike.imgPath,
        fit: BoxFit.fill, height: size.height * 0.2, width: size.width * 0.8);
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
