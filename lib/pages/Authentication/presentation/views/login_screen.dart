import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/constants/images.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/utilities/common_textfield.dart';
import 'package:moto_park/utilities/const_string.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:moto_park/Extension/text_field_extenstion.dart';

import '../controllers/loginController.dart';

class LoginScreen extends GetView<LoginController> {
  final formGlobalKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<LoginController>(builder: (controller) {
        return SafeArea(
            child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.black.withOpacity(.0),
                body: _mainBody()));
      }),
    );
  }

  Widget _mainBody() {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: Stack(
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
                      height: Get.height * .43,
                      decoration: const BoxDecoration(
                          color: appColor,
                          // color: appColor,
                          // gradient: appBarGradient(),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(50, 30, 50, 50),
                          child: Image.asset(appIcon)))),
              Positioned(
                left: 20,
                right: 20,
                bottom: 30,
                child: Container(
                  height: Get.height * .59,
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade500, blurRadius: 7)
                      ]),
                  // padding: const EdgeInsets.all(10),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Welcome to Moto-Park!",
                        style: BalooStyles.baloosemiBoldTextStyle(
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ).marginSymmetric(vertical: 20),
                      _form().paddingSymmetric(horizontal: 5, vertical: 15),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgot);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 50,
                            child: Text(
                              "Forgot Password",
                              style: BalooStyles.balooboldTextStyle(
                                  color: Colors.black54),
                              // textAlign: TextAlign.end,
                            ).paddingOnly(top: 10, right: 5, left: 10),
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 10),
                      vGap(10),
                      GradientButton(
                        onTap: () {
                          if (formGlobalKey.currentState!.validate()) {
                            controller.hitLoginAPI();
                          }
                          // Get.offAllNamed(AppRoutes.homeScreen);

                          // controller.hitLoginAPI();
                        },
                        name: 'Login',
                      ).marginOnly(bottom: 15, left: 10, right: 10),

                      goToRegisterView()
                      /*    Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: CupertinoCheckbox(
                              // splashRadius: 20,
                                value: controller.isChecked,
                                activeColor: appColor,
                                side: const BorderSide(color: grey),
                                onChanged: controller.updateChecked),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Privacy Policy",
                                    style: BalooStyles.baloonormalTextStyle(
                                        underLineNeeded: true,
                                        color: grey,
                                        size: 11.5),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Terms & Conditions",
                                    style: BalooStyles.baloonormalTextStyle(
                                        underLineNeeded: true,
                                        color: grey,
                                        size:  11.5),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Refund Policy",
                                    style: BalooStyles.baloonormalTextStyle(
                                        underLineNeeded: true,
                                        color: grey,
                                        size:  11.5),
                                  )),
                            ],
                          ),
                        ],
                      )*/

                      // goToRegisterView()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _form() {
    return Form(
        key: formGlobalKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: "Phone".tr,
              controller: controller.phoneController,
              textInputType: TextInputType.phone,
              focusNode: controller.phoneFocusNode,
              onFieldSubmitted: (String? value) {
                FocusScope.of(Get.context!)
                    .requestFocus(controller.passwordFocusNode);
              },
              labletext: "Phone",
              prefix: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    // color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                  ),
                  child: CountryCodePicker(
                      flagWidth: 15.0,
                      initialSelection: 'IN',
                      boxDecoration:
                          const BoxDecoration(color: Colors.transparent),
                      showCountryOnly: true,
                      onChanged: (value) {
                        controller.countryCodeVal = value.dialCode.toString();
                        controller.update();
                      })),
              validator: (value) {
                return value?.isEmptyField(messageTitle: "phone number");
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            vGap(16),
            CustomTextField(
              hintText: "Password".tr,
              labletext: "Password",
              controller: controller.passwordController,
              obsecureText: controller.obsecurePassword,
              validator: (value) {
                return value?.validatePassword();
              },
              prefix: SVGImage(lockSvg, color: blackColor),
              suffix: IconButton(
                  onPressed: () {
                    controller.showOrHidePasswordVisibility();
                  },
                  icon: Icon(
                    controller.obsecurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  )),
              focusNode: controller.passwordFocusNode,
              onFieldSubmitted: (String? value) {
                FocusScope.of(Get.context!).unfocus();
              },
            ),
          ],
        ));
  }

  goToRegisterView() {
    return Text.rich(
      TextSpan(
          text: "Don't have an account? ".tr,
          style:
              BalooStyles.baloonormalTextStyle(size: 15, color: Colors.black45),
          children: [
            TextSpan(
              text: "Sign Up".tr,
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(AppRoutes.signUp);
                },
              style: BalooStyles.balooboldTextStyle(color: appColor),
            ),
          ]),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

/*
  Widget _mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
      
            Container(
              height: Get.height*.3,
              width: Get.width,
              color: appColor,
              child: Container(
                height: Get.height*.3,
                padding: EdgeInsets.all(50),
                child: Image.asset(
                  appIcon,
                  // height: 100,
                  // width: 120,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          Text(
            "Welcome to Moto-Park!",
            style: BalooStyles.baloosemiBoldTextStyle(size: 20),
            textAlign: TextAlign.center,
          ).marginSymmetric(vertical: 20),
          Text(
            "Enter Login Details",
            style: BalooStyles.baloosemiBoldTextStyle(size: 18),
            textAlign: TextAlign.center,
          ).marginSymmetric(horizontal: 20),
          vGap(30),
          _form(),
          _rememberOrForgotView(controller: controller),
      
          vGap(55),
          GradientButton(
            onTap: () {
              // if (formGlobalKey.currentState?.validate() ?? false) {
              //   controller.hitLoginAPI();
              // }
              // if(storage.read(isVerifiedQr) ==true &&(storage.read(isSubscribed) == true)){
              //   Get.toNamed(AppRoutes.homeScreen);
              // }else{
                Get.toNamed(AppRoutes.homeScreen);
              // }
            },
            name: 'Login',
          ).marginOnly(bottom: 20,left: 20,right: 20),
          vGap(20),
      
          goToRegisterView()
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
                hintText: "Phone",
                controller: controller.phoneController,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (String? value) {
                  FocusScope.of(Get.context ?? Get.context!)
                      .requestFocus(controller.passwordFocusNode);
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(13),
                ],

                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone number can't be empty";
                  } else if (value.length < 10) {
                    return "Please enter valid phone number";
                  }
                },
                prefix: Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    ),
                    child: CountryCodePicker(
                        flagWidth: 15.0,
                        initialSelection: 'IN',
                        boxDecoration: const BoxDecoration(color: Colors.transparent),
                        showCountryOnly: true,
                        onChanged: (value) {
                          controller.countryCodeVal = value.dialCode.toString();
                          controller.update();
                        })),
                focusNode: controller.emailFocusNode),
            vGap(16),
            CustomTextField(
              hintText: "Password".tr,
              maxLines: 1,
              controller: controller.passwordController,
              obsecureText: controller.obsecurePassword,
              validator: (value) {
                return value?.isEmptyField(messageTitle: "Password");
              },
              suffix: IconButton(
                  onPressed: () {
                    controller.showOrHidePasswordVisibility();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    controller.obsecurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color:  controller.obsecurePassword?Colors.grey:appColor,
                  )),
              focusNode: controller.passwordFocusNode,
              onFieldSubmitted: (String? value) {
                FocusScope.of(Get.context!).unfocus();
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 20));
  }

  _rememberOrForgotView({required LoginController controller}) {
    return Row(
      children: [
        Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              activeColor: appColor,
              value: controller.isRememberMe,
              onChanged: (value) {
                controller.isRememberMe = value;
                controller.update();
              },
            )),
        Spacer(),
        InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.forgot);
          },
            child: Text("Forgot Password",style: BalooStyles.baloosemiBoldTextStyle(),))
      ],
    ).marginSymmetric(vertical: 10,horizontal: 20);
  }

  goToRegisterView() {
    return Text.rich(
      TextSpan(
          text: "Not a member?".tr,
          style: BalooStyles.balooboldTextStyle(size: 18),
          children: [
            TextSpan(
              text: "Register".tr,
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(AppRoutes.signUp);
                },
              style: BalooStyles.balooboldTextStyle(size: 18,color: appColor),
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

  */
}
