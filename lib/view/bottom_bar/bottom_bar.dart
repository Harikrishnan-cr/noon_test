



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noon/controller/bottombar_controller/bottombar_controller.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/view/account_screen/account_screen.dart';
import 'package:noon/view/home_screen/home_screen.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final bottomBarController = Get.put(BottomBarController());
  final tabs = [
   HomeScreen(),
    const Center(
      child: Text('catagories'),
    ),
    const Center(
      child: Text('clearence'),
    ),
    AccountScreen(),
    const Center(
      child: Text('cart'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<BottomBarController>(builder: (bottomBarController) {
      return tabs[bottomBarController.currentIndex];
    }), bottomNavigationBar:
            GetBuilder<BottomBarController>(builder: (bottomBarController) {
      return BottomNavigationBar(
        currentIndex: bottomBarController.currentIndex,
        type: BottomNavigationBarType.fixed,
        
        unselectedLabelStyle: const TextStyle(color: AppColors.greyColor,fontSize: 10),
        selectedLabelStyle:
            const TextStyle(color: AppColors.greyColor, fontWeight: FontWeight.w400,fontSize: 10),
        selectedItemColor: AppColors.yellowColor,
        backgroundColor: AppColors.whiteColor,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: AppColors.yellowColor),
            icon: Icon(
              Icons.home,
              color: AppColors.greyColor,
            ),
            label: 'Home', 
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.category_outlined, color: AppColors.yellowColor),
              icon: Icon(Icons.category_outlined, color: AppColors.greyColor),
              label: 'categories'), 
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.card_giftcard, color: AppColors.yellowColor),
            icon: Icon(Icons.card_giftcard , color: AppColors.amberColor),
            label: 'Clearance Deals',
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person_outline_rounded, color: AppColors.yellowColor),
              icon: Icon(Icons.person_outline_rounded, color: AppColors.greyColor),
              label: 'My Account'),
               BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_cart, color: AppColors.yellowColor),
              icon: Icon(Icons.shopping_cart, color: AppColors.greyColor),
              label: 'Cart'), 
        ],
        onTap: (value) {
          bottomBarController.changeCurrentIndex(value);
        },
      );
    }));
  }
}