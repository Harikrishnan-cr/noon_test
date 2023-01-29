


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/consts/image_paths.dart';
import 'package:noon/core/fonts/google_fonts.dart';
import 'package:noon/core/size/size.dart';

AppBar homeAppBar(width){

  return AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: .5,
        title: SvgPicture.asset(
          appLogoSvgImg,
          width: width * 0.25,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: Container(
              width: width * 0.68,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor, width: .8),
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: AppColors.greyColor,
                    ),
                    kwidth10,
                    Text(
                      'What are you looking for?',
                      style: GoogleFont.serachTextStyle,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
}