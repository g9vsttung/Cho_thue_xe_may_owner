// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:chothuexemay_owner/models/bike_model.dart';
import 'package:chothuexemay_owner/models/brand_model.dart';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Components/bike_info.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Create/create_view.dart';
import 'package:chothuexemay_owner/views/Manage/SubView/Edit/edit_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageBody extends StatefulWidget {
  ManageBody({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ManageBody();
  }
}

class _ManageBody extends State<ManageBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<BrandViewModel>(context, listen: false).getAll();
    Provider.of<OwnerViewModel>(context, listen: false).getBikes();
  }

  @override
  Widget build(BuildContext context) {
    final BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
    final OwnerViewModel _bikeViewModel = Provider.of<OwnerViewModel>(context);
    List<Brand> brands = _brandViewModel.brands;
    List<Bike> bikes = _bikeViewModel.bikes;
    return Padding(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bảng giá",
              style: TextStyle(
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      String value = brands[0].id;
                      String type = brands[0].categories[0].id;

                      return CreateView(
                          fisrtSelectBrand: value,
                          fisrtSelectType: type,
                          fisrtSelectYear:
                              StringConstants.YEAR_DROPDOWN_START.toString());
                    },
                  ));
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  "+ Thêm xe",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Xe của bạn",
              style: TextStyle(
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            for (Bike bike in bikes)
              BikeInfo(
                  image: "yamahaEx.png",
                  brand: bike.brandName,
                  name: bike.categoryName,
                  color: bike.color,
                  year: bike.modelYear,
                  bienSo: bike.licensePlate,
                  onEdit: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        String value = _brandViewModel.brands[0].id;
                        String type = _brandViewModel.brands[0].categories[0].id;

                        return EditView(
                            fisrtSelectBrand: value,
                            fisrtSelectType: type,
                            fisrtSelectYear: "2012"
                        );
                      },
                    ));
                  },
              ),
                  
          ],
        ),
      ),
    );
  }
}
