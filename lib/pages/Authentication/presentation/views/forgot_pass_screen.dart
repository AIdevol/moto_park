import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/forgot_pass_controller.dart';
import 'package:moto_park/utilities/common_textfield.dart';
import 'package:moto_park/utilities/const_string.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:moto_park/Extension/text_field_extenstion.dart';

class ForgotPasswordScreen extends GetView<ForgotPassController> {
  final formGlobalKey = GlobalKey<FormState>();
  ForgotPassController loginController = Get.put(ForgotPassController());
  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<ForgotPassController>(builder: (controller) {
        return InkWell(
          onTap: () {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: Scaffold(
              extendBodyBehindAppBar: true,
              // appBar:   backAppBar(),
              backgroundColor: Colors.white,
              body: _mainBody()),
        );
      }),
    );
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  height: Get.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: Get.height * .53,
                      decoration: const BoxDecoration(
                          color: appColor,
                          // color: appColor,
                          // gradient: appBarGradient(),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(60, 0, 60, 70),
                          child: Image.asset(appIcon)))),
              Positioned(
                left: 20,
                right: 20,
                bottom: 30,
                child: Container(
                  height: Get.height * .5,
                  // height: Get.height*.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 7,
                          // offset: Offset(0,2)
                        )
                      ]),
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 20),
                    children: [
                      vGap(10),
                      _form(),
                      vGap(40),
                      GradientButton(
                        onTap: () {
                          if (formGlobalKey.currentState!.validate()) {
                            controller.forgotPasswordApiCall();
                          }
                        },
                        name: 'Forgot Password',
                      ).marginOnly(bottom: 20),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Get.height * .3,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    vGap(20),
                    Text(
                      "Forgot Password",
                      style: BalooStyles.baloosemiBoldTextStyle(
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    vGap(10),
                    Text(
                      "Enter your email address associated with your account, an OTP will be send to your registered email address.",
                      style:
                          BalooStyles.baloonormalTextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ).paddingSymmetric(horizontal: 30),
                  ],
                ),
              ),
              Positioned(top: 40, left: 15, child: backIcon())
            ],
          ),
        ],
      ),
    );
  }

  _form() {
    return Form(
        key: formGlobalKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: "Email".tr,
              labletext: "Email address",
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                return value?.isValidEmail();
              },
            ),
            vGap(16),
          ],
        ));
  }

  goToRegisterView() {
    return Text.rich(
      TextSpan(
          text: "Not a member?".tr,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed(AppRoutes.signUp);
            },
          style: BalooStyles.balooboldTextStyle(size: 18),
          children: [
            TextSpan(
              text: "Register".tr,
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(AppRoutes.signUp);
                },
              style: BalooStyles.balooboldTextStyle(size: 18),
            ),
          ]),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
