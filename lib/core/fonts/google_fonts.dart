import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noon/core/color/colors.dart';

class GoogleFont {
  static TextStyle loginMainText = GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryBlackColor);
  static TextStyle loginHintText = GoogleFonts.poppins(
      fontWeight: FontWeight.bold, color: AppColors.greyColor);
  static TextStyle richTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle loginHintTextTop = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, color: AppColors.greyColor);

       static TextStyle serachTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, color: AppColors.greyColor,fontSize: 12);

  static TextStyle buttonTextStyleLogin = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,color: AppColors.whiteColor);


      //------------------Home Screen ---------------------------

   static TextStyle homeScreenHead = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, color: AppColors.headTextBlackColor,fontSize: 17); 

       static TextStyle recomendeTiletext = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, color: AppColors.blackColor,fontSize: 14);  

       static TextStyle dealsCommonTextstyle = GoogleFonts.poppins( 
     fontWeight: FontWeight.bold,color: AppColors.blackColor,fontSize: 16.2);  
       static TextStyle megaDealSpecialTextstyle = GoogleFonts.poppins( 
     fontWeight: FontWeight.bold,color: AppColors.redColor,fontSize: 13);   
}
