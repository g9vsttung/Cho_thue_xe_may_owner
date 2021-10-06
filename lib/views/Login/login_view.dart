import 'package:chothuexemay_owner/views/Login/components/body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginView();
  }
}

class _LoginView extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backGround.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: LoginBody(
            size: size,
          )
      ),
    );
  }
}
