import 'package:chothuexemay_owner/constants/constant.dart';
import 'package:chothuexemay_owner/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginBody extends StatelessWidget{
  Size size;
  LoginBody({required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: size.height*0.55),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login with",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Google account",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeView();
                },));
              },
                icon: Image.asset(StrConstant.iconPath+"google.png",width: size.width*0.2,), iconSize: size.width*0.2,)
            ],
          ),
        ),
      ),
    );
  }

}