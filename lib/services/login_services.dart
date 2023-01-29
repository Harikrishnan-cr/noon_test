import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noon/controller/login_controller/login_controller.dart';
import 'package:noon/view/bottom_bar/bottom_bar.dart';
import 'package:noon/view/home_screen/home_screen.dart';

class LoginServices {
  static final fireBaseAuth = FirebaseAuth.instance;
  final loginController = Get.put(LoginController());
  Future loginUser(
      {required String userEmail,
      required String userPassword,
      required BuildContext context}) async {
    try {
      loginController.isLoadingMeathode(true);
      if (userEmail.isNotEmpty && userPassword.isNotEmpty) {
        await fireBaseAuth
            .signInWithEmailAndPassword(
                email: userEmail, password: userPassword)
            .then((value) => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => BottomBarScreen(),
                ),
                (route) => false))
            .whenComplete(() {
          loginController.isLoadingMeathode(false);
        });
      } else {
        loginController.isLoadingMeathode(false);
      }
    } catch (e) {
      log('ffffffffff');
      loginController.isUserInavalid();
      loginController.isLoadingMeathode(false);
      log(e.toString());
    }
  }
}
