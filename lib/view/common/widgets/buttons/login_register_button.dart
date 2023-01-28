



import 'package:flutter/material.dart';
import 'package:noon/core/fonts/google_fonts.dart';

class CommonButtonLoginRegister extends StatelessWidget {
  const CommonButtonLoginRegister({
    Key? key,
    required this.buttonColor,
    required this.buttonText,
  }) : super(key: key);

  final MaterialColor buttonColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
     height: 48,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
       color:buttonColor,
    ),
     child:  Center(child: Text(buttonText,style: GoogleFont.buttonTextStyleLogin)), 
    );
  }
}
