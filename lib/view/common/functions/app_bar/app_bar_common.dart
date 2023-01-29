


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/size/size.dart';

AppBar commonAppBar() {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SvgPicture.asset('assets/svg/noon-logo-en.svg',
          height: 25, width: 60, fit: BoxFit.scaleDown),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 90,
    actions:  [
      Icon(
        Icons.close,
        size: 32,
        color: AppColors.blackColor,
      ),
      kwidth20,
      kwidth5
    ],
  );
}