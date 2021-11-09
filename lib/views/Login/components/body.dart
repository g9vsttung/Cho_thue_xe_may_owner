// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors

import 'package:chothuexemay_owner/models/owner_model.dart';
import 'package:chothuexemay_owner/view_model/google_signin_in_view_model.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/EditProfile/edit_profile.dart';
import 'package:chothuexemay_owner/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  Size size;

  LoginBody({Key? key, required this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInViewModel>(context, listen: false);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.55),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green[200],
                      onPrimary: Colors.black,
                      minimumSize: Size(size.width * 0.8, 50)),
                  onPressed: () async {
                    int isLoginSuccess =
                        await provider.googleLogin(context: context);

                    if (isLoginSuccess == 200) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => HomeView(),
                        ),
                        (route) => false,
                      );
                    } else if (isLoginSuccess == 1) {
                      Owner o = await Provider.of<OwnerViewModel>(context,
                              listen: false)
                          .viewProfile();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>
                              EditProfileView(owner: o),
                        ),
                        (route) => false,
                      );
                    } else if (isLoginSuccess == -1) {
                      Fluttertoast.showToast(
                        msg: 'Tạo tài khoản thất bại! Hãy thử lại sau.',
                        gravity: ToastGravity.CENTER,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Xin lỗi, bạn không thể đăng nhập lúc này.',
                        gravity: ToastGravity.CENTER,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red[800],
                  ),
                  label: Text('Đăng nhập với Google')),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
