// ignore_for_file: avoid_function_literals_in_foreach_calls, must_be_immutable

import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/models/category_model.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownCreate extends StatefulWidget {
  String categoryDropDown;
  String selectedBrand = "";
  String dropDownValue;
  Function(String selected) onChanged;
  DropDownCreate(
      {Key? key,
      required this.categoryDropDown,
      required this.onChanged,
      String? brand,
      required this.dropDownValue})
      : super(key: key) {
    if (brand != null) {
      selectedBrand = brand;
    }
  }
  @override
  State<StatefulWidget> createState() {
    return _DropDownCreate();
  }
}

class _DropDownCreate extends State<DropDownCreate> {
  @override
  Widget build(BuildContext context) {
    final BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
    Size size = MediaQuery.of(context).size;
    List<Brand> listBrandObject = _brandViewModel.brands;
    // ignore: unused_local_variable
    List<Temporary> listItem = [];
    if (widget.categoryDropDown == "Brand") {
      listBrandObject.forEach((Brand brand) {
        Temporary t = Temporary(brand.id, brand.name);
        listItem.add(t);
      });
    } else if (widget.categoryDropDown == "Type") {
      Brand brand =
          listBrandObject.firstWhere((x) => x.id == widget.selectedBrand);
      brand.categories.forEach((Category category) {
        Temporary t = Temporary(category.id, category.name);
        listItem.add(t);
      });
    } else {
      listItem = createYearData();
    }
    if (widget.dropDownValue == "") {
      widget.dropDownValue = listItem[0].key;
    }
    return Container(
      width: size.width * 0.4,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: DropdownButton(
          underline: const SizedBox(),
          value: widget.dropDownValue,
          onChanged: (value) {
            widget.onChanged(value.toString());
          },
          iconSize: 12,
          icon: Image.asset(
            "assets/icons/dropDown.png",
            color: Colors.black,
            width: 14,
          ),
          items: listItem.map((Temporary t) {
            return DropdownMenuItem(
              value: t.key,
              child: SizedBox(
                width: size.width * 0.4 - 20,
                child: Text(
                  t.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList()),
    );
  }

  List<Temporary> createYearData() {
    List<Temporary> listYear = [];
    final DateTime now = DateTime.now();
    int count = 1;
    for (int i = 2012; i <= now.year; i++) {
      Temporary t = Temporary((count++).toString(), i.toString());
      listYear.add(t);
    }
    return listYear;
  }
}

class Temporary {
  String key;
  String value;
  Temporary(this.key, this.value);
}
