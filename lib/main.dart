// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_owner/view_model/bike_view_model.dart';
import 'package:chothuexemay_owner/view_model/booking_view_model.dart';
import 'package:chothuexemay_owner/view_model/brand_view_model.dart';
import 'package:chothuexemay_owner/view_model/category_view_model.dart';
import 'package:chothuexemay_owner/view_model/customer_view_model.dart';
import 'package:chothuexemay_owner/view_model/feedback_view_model.dart';
import 'package:chothuexemay_owner/view_model/google_signin_in_view_model.dart';
import 'package:chothuexemay_owner/view_model/owner_view_model.dart';
import 'package:chothuexemay_owner/views/Login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSignInViewModel>(
            create: (context) => GoogleSignInViewModel()),
        ChangeNotifierProvider<BrandViewModel>(
            create: (context) => BrandViewModel()),
        ChangeNotifierProvider<OwnerViewModel>(
            create: (create) => OwnerViewModel()),
        ChangeNotifierProvider<BikeViewModel>(
            create: (create) => BikeViewModel()),
        ChangeNotifierProvider<CustomerViewModel>(
            create: (create) => CustomerViewModel()),
        ChangeNotifierProvider<CategoryViewModel>(
            create: (create) => CategoryViewModel()),
        ChangeNotifierProvider<FeedbackViewModel>(
            create: (create) => FeedbackViewModel()),
        ChangeNotifierProvider<BookingTransactionViewModel>(
            create: (create) => BookingTransactionViewModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Owner',
          theme: ThemeData(
            primaryColor: Color(0xFFFFEBEE),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: LoginView()),
    );
  }
}
