import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/view/home_screen/home_screen.dart';
import 'package:noon/view/login_screen/login_screen.dart';

import 'package:noon/view/register_screen/register_screen.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(canvasColor: AppColors.whiteColor),
      home:  HomeScreen(),  
    );
  }
}
