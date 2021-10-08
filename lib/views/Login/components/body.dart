import 'package:chothuexemay_owner/view_model/google_signin_in_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  Size size;

  LoginBody({required this.size});
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
                  onPressed: () {
                    provider.googleLogin(context: context);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red[800],
                  ),
                  label: Text('Đăng nhập với Google')),
              SizedBox(
                height: 10,
              ),
              // IconButton(
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) {
              //         return HomeView();
              //       },
              //     ));
              //   },
              //   icon: Image.asset(
              //     StrConstant.iconPath + "google.png",
              //     width: size.width * 0.2,
              //   ),
              //   iconSize: size.width * 0.2,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
