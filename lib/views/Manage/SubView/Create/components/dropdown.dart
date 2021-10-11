import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/models/category_model.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownCreate extends StatefulWidget {
  String categoryDropDown;
  String selectedBrand = "";
  Function(String selected) onChanged;
  DropDownCreate(
      {required this.categoryDropDown,
      required this.onChanged,
      String? brand}) {
    selectedBrand = brand!;
  }
  @override
  State<StatefulWidget> createState() {
    return _DropDownCreate();
  }
}

class _DropDownCreate extends State<DropDownCreate> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BrandViewModel>(context, listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    final BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
    Size size = MediaQuery.of(context).size;
    List<Brand> listBrandObject = _brandViewModel.brands;
    Map<String, String> listYear = {'1': "2019", '2': "2020", '3': "2021"};
    List<Temporary> listItem = [];
    if (widget.categoryDropDown == "Brand") {
      listBrandObject.forEach((Brand brand) {
        Temporary t = Temporary(brand.id, brand.name);
        listItem.add(t);
      });
    } else if (widget.categoryDropDown == "Type") {
      Brand brand = listBrandObject.firstWhere((Brand x) {
        if (x.id == widget.selectedBrand)
          return true;
        else
          return false;
      });
      brand.categories.forEach((Category category) {
        Temporary t = Temporary(category.id, category.name);
        listItem.add(t);
      });
    } else {
      Temporary t = Temporary('1', '2020');
      listItem.add(t);
      t = Temporary('2', '2021');
      listItem.add(t);
      t = Temporary('3', '2019');
      listItem.add(t);
    }
    return Container(
      width: size.width * 0.4,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: DropdownButton(
          underline: SizedBox(),
          value: listItem[0],
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
              child: Container(
                width: size.width * 0.4 - 20,
                child: Text(
                  t.value,
                  style: TextStyle(
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
}

class Temporary {
  String key;
  String value;
  Temporary(this.key, this.value);
}
