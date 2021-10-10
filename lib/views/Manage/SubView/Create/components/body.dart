import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CreateBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateBody();
  }
}

class _CreateBody extends State<CreateBody> {
  TextEditingController colorController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  List<Brand> listBrandObject = [
    Brand("Honda", ["Vison", "AirBlade", "Wave"]),
    Brand("Yamaha", ["Sirus", "Exciter", "Special"]),
    Brand("Vespa", ["Cub", "Ves11", "Ves2"])
  ];
  List<String> listYear = ["2019", "2020", "2021"];
  String selectedBrand = Brand("Honda", [
    "Vison",
    "AirBlade",
    "Wave"
  ]).brandName; //Lấy thg đầu tiên trong listObject làm default (t khai báo cứng nên k lấy thg kia xuống đc
  String selectedType =
      Brand("Honda", ["Vison", "AirBlade", "Wave"]).listType[0]; //Giống ở trên
  String selectedYear = ["2019", "2020", "2021"][0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Column(
              children: [
                Center(
                  child: Text(
                    "THÊM XE MỚI",
                    style: TextStyle(
                      color: ColorConstants.textBold,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1, color: Colors.black54))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Column(
              children: [
                Center(
                  child: Container(
                height: 35,
              child: RaisedButton(
                onPressed: () {
                  //Thêm ảnh ở đây
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  "Thêm ảnh",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
                ),
                Center(
                  child: Text(
                    "anh_ma_an_chon_.PNG",
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
            padding: EdgeInsets.only( left: size.width*0.1),
              height: size.height*0.6,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hãng",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Loại xe",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Đời xe",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Màu",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Biển số",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      getDropDownBox("Brand", size),
                      getDropDownBox("Type", size),
                      getDropDownBox("Year", size),
                      Container(
                        width: size.width * 0.4,
                        height: 35,
                        child: TextField(
                          controller: colorController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                                fontSize: 14),
                            hintText: "Đỏ vàng",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        height: 35,
                        child: TextField(
                          controller: licensePlateController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                                fontSize: 14),
                            hintText: "59-AA 999.99",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.black),
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
                Container(
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {},
                    child: Text(
                      "Hủy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {},
                    child: Text(
                      "Đồng ý",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
  }

  Widget getDropDownBox(String categoryDropDown, Size size) {
    List<String> listItem = [];
    if (categoryDropDown == "Brand") {
      listBrandObject.forEach((Brand brand) {
        listItem.add(brand.brandName);
      });
    } else if (categoryDropDown == "Type") {
      Brand brand = listBrandObject.firstWhere((Brand x) {
        if (x.brandName == selectedBrand)
          return true;
        else
          return false;
      });
      listItem = brand.listType;
    } else {
      listItem = listYear;
    }
    return Container(
      width: size.width * 0.4,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Colors.black, width: 1),
        ),
      child: DropdownButton(
        underline: SizedBox() ,
          value: listItem[0],
          onChanged: (selected) {
            setState(() {
              if (categoryDropDown == "Brand") {
                selectedBrand = selected.toString();
              } else if (categoryDropDown == "Type") {
                selectedType = selected.toString();
              } else {
                selectedYear = selected.toString();
              }
            });
          },
          iconSize: 12,
          icon: Image.asset("assets/icons/dropDown.png",color: Colors.black,width: 14,),
          items: listItem.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Container(
                width: size.width*0.4-20,
                child: Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList()),
    );
  }
}
