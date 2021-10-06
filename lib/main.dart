import 'package:chothuexemay_owner/views/Login/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Owner',
      theme: ThemeData(
        primaryColor: Color(0xFFFFEBEE),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginView()
    );
  }
}

