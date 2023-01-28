import 'package:flutter/material.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/fonts/google_fonts.dart';

class TextFeildCommonWidget extends StatelessWidget {
  const TextFeildCommonWidget(
      {Key? key,
      required this.textEditingControllers,
      required this.hintText,
      required this.hintTextTop,
      this.passwordIcons,
      this.isVisible,
      this.onChanged,
      this.errorMessages})
      : super(key: key);

  final TextEditingController textEditingControllers;
  final String hintText;
  final String hintTextTop;
  final Widget? passwordIcons;

  final bool? isVisible;
  final String? errorMessages;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hintTextTop,
              style: GoogleFont.loginHintTextTop,
            ),
            TextFormField(
              onChanged: onChanged,
              obscureText: isVisible ?? false,
              controller: textEditingControllers,
              cursorColor: AppColors.amberColor,
              decoration: InputDecoration(
                  errorText: errorMessages,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.greyColor),
                  suffixIcon: passwordIcons,
                  labelStyle: GoogleFont.loginHintText),
            ),
          ],
        ));
  }
}
