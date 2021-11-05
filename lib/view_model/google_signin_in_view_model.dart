// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_owner/Repositories/Implementations/owner_repository.dart';
import 'package:chothuexemay_owner/views/Home/home_view.dart';
import 'package:chothuexemay_owner/views/Login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInViewModel extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  final OwnerRepository _ownerRepository = OwnerRepository();

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    }

    return firebaseApp;
  }

  Future<int> googleLogin({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    GoogleSignInAuthentication googleSignInAuthentication;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
        var accessToken = await userCredential.user!.getIdToken();
        return await _ownerRepository.login(user!.uid, accessToken);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          customSnackBar(
            content: 'Error occurred while accessing credentials. Try again.',
          );
        }
      } catch (e) {
        customSnackBar(
          content: 'Error occurred using Google Sign-In. Try again.',
        );
      }
    }
    notifyListeners();
    return -1;
  }

  Future signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LoginView(),
        ),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
        content: 'Lỗi, vui lòng thử lại',
      ));
    }
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}
