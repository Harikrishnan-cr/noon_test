import 'package:flutter/cupertino.dart';
import 'package:noon/core/fonts/google_fonts.dart';

class RichTextLoginRegister extends StatelessWidget {
  const RichTextLoginRegister({
    Key? key,
    required this.richText1,
    required this.richText2,
  }) : super(key: key);

  final String richText1;
  final String richText2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: RichText(
          text: TextSpan(style: GoogleFont.loginHintTextTop, children: [
        TextSpan(text: richText1),
        TextSpan(text: richText2, style: GoogleFont.richTextStyle),
      ])),
    );
  }
}

class MainTextLoginRegister extends StatelessWidget {
  const MainTextLoginRegister({
    Key? key,
    required this.mainTextHome,
  }) : super(key: key);

  final String mainTextHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        mainTextHome,
        style: GoogleFont.loginMainText,
      ),
    );
  }
}
