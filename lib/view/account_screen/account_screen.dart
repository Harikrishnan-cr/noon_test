

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:noon/view/login_screen/login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final fireBaseAuth = FirebaseAuth.instance;
    return Scaffold(

      body: Center(
        child: ElevatedButton(onPressed: () {
         fireBaseAuth.signOut().then((value) => Get.offAll(()=>LoginScreen()));
        }, child: Text('Log Out')),
      ),
    );
  }
}