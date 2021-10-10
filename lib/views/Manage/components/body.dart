import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:chothuexemay_owner/views/Manage/Create/create_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ManageBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bảng giá",
              style: TextStyle(
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CreateView();
                  },));
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  "+ Thêm xe",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text(
              "Xe của bạn",
              style: TextStyle(
                color: ColorConstants.textBold,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            )
          ],
        ),
      ),
    );
  }

}