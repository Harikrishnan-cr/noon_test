import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/consts/text_const.dart';
import 'package:noon/core/fonts/google_fonts.dart';
import 'package:noon/view/bottom_bar/bottom_bar.dart';
import 'package:noon/view/login_screen/login_screen.dart';


import 'package:noon/view/splash_screen.dart/splash_screen.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
bool user = false;
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
isUserLogedIn(); 

  }


  void isUserLogedIn() {
    final fireBaseAuth = FirebaseAuth.instance;
    try {
      final isUserLog = fireBaseAuth.currentUser;

      if (isUserLog != null) {
        log(isUserLog.email.toString());
        setState(() {
          user = true;
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(canvasColor: AppColors.whiteColor),
      home:  AnimatedSplashScreen(
            duration: 3000,
            splash: Text('noon',style: GoogleFont.splashScreenText,), 
            nextScreen: user ? BottomBarScreen() : LoginScreen(), 
            splashTransition: SplashTransition.fadeTransition,
        
            backgroundColor: AppColors.yellowColor)
      
      
      );
  }
}
