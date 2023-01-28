import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:noon/controller/login_controller/login_controller.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/size/size.dart';
import 'package:noon/services/login_services.dart';
import 'package:noon/view/common/functions/app_bar/app_bar_common.dart';
import 'package:noon/view/common/widgets/buttons/login_register_button.dart';
import 'package:noon/view/common/widgets/text_feild/text_feild.dart';
import 'package:noon/view/common/widgets/texts/login_page_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final String buttonText = 'Sign up';
  final richText1 = 'Dont have an account? ';
  final mainTextHome = 'Hala! Welcome back!';
  final richText2 = 'Sign Up';
  final buttonColor = AppColors.amberColor;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginControl = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/noon-bg-img.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTextLoginRegister(mainTextHome: mainTextHome),
                  kheight15,
                  GetBuilder<LoginController>(builder: (loginController) {
                    return TextFeildCommonWidget(
                      onChanged: (value) {
                        loginController.onEmailError(value: value);
                      },
                       errorMessages: loginController.emailIdError, 
                      textEditingControllers: emailController,
                      hintText: 'Please enter your email address',
                      hintTextTop: 'Email',
                    );
                  }),
                  kheight15,
                  GetBuilder<LoginController>(builder: (loginController) {
                    return TextFeildCommonWidget(
                      onChanged: (value) {
                        loginController.onPasswordError(value);
                      },
                     errorMessages: loginController.passwordError,
                      textEditingControllers: passwordController,
                      hintText: 'Please enter your password',
                      hintTextTop: 'Password',  
                      passwordIcons: const Icon(Icons.visibility),
                    );
                  }),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor),
                    ),
                  ),
                  GetBuilder<LoginController>(builder: (regController) {
                    return regController.isValidText != null
                        ? Center(
                            child: Text(
                              regController.isValidText!,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        : const SizedBox();
                  }),
                  kheight20,
                  Center(child:
                      GetBuilder<LoginController>(builder: (loginController) {
                    return GestureDetector(
                        onTap: () {
                          loginController.checkIsValid();
                          LoginServices().loginUser(
                              userEmail: emailController.text,
                              userPassword: passwordController.text,
                              context: context);
                        },
                        child: !loginController.isLoading
                            ? CommonButtonLoginRegister(
                                buttonColor: buttonColor,
                                buttonText: buttonText)
                            : const CircularProgressIndicator(
                                color: AppColors.amberColor,
                                strokeWidth: 5,
                              ));
                  })),
                  RichTextLoginRegister(
                      richText1: richText1, richText2: richText2)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
