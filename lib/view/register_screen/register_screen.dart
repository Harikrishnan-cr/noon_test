import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:noon/controller/register_controller/register_controller.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/size/size.dart';
import 'package:noon/view/common/functions/app_bar/app_bar_common.dart';
import 'package:noon/view/common/widgets/buttons/login_register_button.dart';
import 'package:noon/view/common/widgets/text_feild/text_feild.dart';
import 'package:noon/view/common/widgets/texts/login_page_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final registerController = Get.put(RegisterScreenController());
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
                  const MainTextLoginRegister(
                      mainTextHome: 'Create a noon account'),
                  kheight15,
                  GetBuilder<RegisterScreenController>(
                      builder: (registerController) {
                    return TextFeildCommonWidget(
                      onChanged: (value) {
                        registerController.onNameError(value);
                      },
                      textEditingControllers: nameController,
                      hintText: 'Please enter your first name',
                      hintTextTop: 'First Name',
                      errorMessages: registerController.nameError,
                    );
                  }),
                  kheight15,
                  GetBuilder<RegisterScreenController>(
                      builder: (registerController) {
                    return TextFeildCommonWidget(
                    onChanged: (value) {
                      registerController.onLastNameError(value); 
                    },
              errorMessages: registerController.lastNameError,
                      textEditingControllers: lastNameController,
                      hintText: 'Please enter last name',
                      hintTextTop: 'Last Name',
                    );
                  }),
                  kheight15,
                  GetBuilder<RegisterScreenController>(
                      builder: (registerController) {
                    return TextFeildCommonWidget(
                      onChanged: (value) {
                        registerController.onEmailError(value);
                      },
                      errorMessages: registerController.emailIdError,
                      textEditingControllers: emailController,
                      hintText: 'Please enter your email address',
                      hintTextTop: 'Email',
                    );
                  }),
                  kheight15,
                  GetBuilder<RegisterScreenController>(
                      builder: (registerController) {
                    return TextFeildCommonWidget(
                      onChanged: (value) {
                        registerController.onPasswordError(value);
                      },
                      isVisible: !registerController.isPassVisible,
                      textEditingControllers: passwordController,
                      errorMessages: registerController.passwordError,
                      hintText: 'Please enter your password',
                      hintTextTop: 'Password',
                      passwordIcons: GestureDetector(
                          onTap: () {
                            registerController.onPasswordVisible();
                          },
                          child: registerController.isPassVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
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
                  GetBuilder<RegisterScreenController>(
                      builder: (regController) {
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
                  GestureDetector(
                    onTap: () {
                      if (registerController.checkIsValid()) {

                        log('is called');
                        registerController.registerUserData(
                            userEmail: emailController.text,
                            userPassword: passwordController.text,
                            context: context);

                            
                      } else {
                        log('In valid user');
                      }
                    },
                    child: const Center(
                        child: CommonButtonLoginRegister(
                            buttonColor: AppColors.amberColor,
                            buttonText: 'Sign Up')),
                  ),
                  const RichTextLoginRegister(
                      richText1: 'Already have an account? ',
                      richText2: 'Sign In')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
