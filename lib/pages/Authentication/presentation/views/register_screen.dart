import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/utilities/common_textfield.dart';
import 'package:moto_park/utilities/const_string.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import '../controllers/registerController.dart';
import 'package:moto_park/Extension/text_field_extenstion.dart';

class RegisterScreen extends GetView<RegisterController> {
  final formGlobalKey = GlobalKey<FormState>();
  final emgformGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(child: GetBuilder<RegisterController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _mainBody(),
        );
      },
    ));
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
                      height: Get.height * .32,
                      width: Get.width,
                      decoration: const BoxDecoration(
                          color: appColor,
                          // color: appColor,
                          // gradient: appBarGradient(),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(70, 50, 70, 70),
                          child: Image.asset(appIcon)))),
              Positioned(
                left: 20,
                right: 20,
                bottom: 10,
                child: Container(
                  height: Get.height * .72,
                  width: Get.width,
                  padding: const EdgeInsets.all(10),
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
                        "Create Account",
                        style:
                            BalooStyles.balooboldTextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ).marginSymmetric(vertical: 10),
                      _form(context: Get.context!)
                          .paddingSymmetric(horizontal: 5, vertical: 0),

                      vGap(20),
                      GradientButton(
                        onTap: _onSignUpPressed,
                        name: 'Sign up',
                      ).marginOnly(bottom: 15, left: 10, right: 10),
/* 
                         Row(
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
                      ) */

                      // goToRegisterView()
                    ],
                  ),
                ),
              ),
              Positioned(top: 30, left: 15, child: backIcon())
            ],
          ),
        ),
      ],
    );
  }

  _title(title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
        color: Colors.grey.shade300,
        child: Text(
          title,
          style: BalooStyles.baloomediumTextStyle(
              size: 14.sp, color: Colors.black),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _form({required BuildContext context}) {
    return Form(
        key: formGlobalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _firstNameFieldView(context: context),
            vGap(16),
            _emailFieldView(context: context),
            vGap(16),
            _phoneFieldView(context: context),
            vGap(16),
            _genderView(context: context),
            vGap(16),
            _addressFieldView(context: context),
            vGap(16),
            _passwordFieldView(context: context),
            vGap(16),
            _confirmPasswordFieldView(context: context),
            vGap(20),
            _title("Emergency Contact Details"),
            vGap(20),
            _emergencyContactFieldView(context: context),
            vGap(16),
            _emergencyContactFieldView2(context: context),
            vGap(16),
            _bloodGroupFieldView(context: context),
            vGap(16),
            _dobFieldView(context: context),
          ],
        ));
  }

  _firstNameFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Name",
        labletext: "Name",
        controller: controller.firstNameController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.emailFocusNode);
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Name");
        },
        focusNode: controller.firsrNameFocusNode);
  }

  _addressFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Address",
        labletext: "Address",
        controller: controller.addressController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.passwordFocusNode);
        },
        suffix: InkWell(
            onTap: () => controller.getCurrentPosition(),
            child: const Icon(
              Icons.location_on_outlined,
              color: darkBlue,
            )),
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Address");
        },
        focusNode: controller.addressFocusNode);
  }

  _emailFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Email",
        labletext: "Email",
        controller: controller.emailController,
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.phoneFocusNode);
        },
        validator: (value) {
          return value?.isValidEmail();
        },
        focusNode: controller.emailFocusNode);
  }

  _phoneFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Phone",
        labletext: "Phone",
        controller: controller.phoneController,
        textInputType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.passwordFocusNode);
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        suffix: _verifyPhoneButton(
            onTap: () => controller.getVerifyContactApi(
                controller.countryCodeVal + controller.phoneController.text, 1),
            text: isVerifyContact1 ? "Verified" : "Verify"),
        validator: (value) {
          if (value!.isEmpty) {
            return "Phone number";
          }
        },
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
                boxDecoration: const BoxDecoration(color: Colors.transparent),
                showCountryOnly: true,
                onChanged: (value) {
                  controller.countryCodeVal = value.dialCode.toString();
                  controller.update();
                })),
        focusNode: controller.phoneFocusNode);
  }

  _passwordFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Password",
        labletext: "Password",
        maxLines: 1,
        controller: controller.passwordController,
        obsecureText: controller.obsecurePassword,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.confirmPasswordFocusNode);
        },
        validator: (value) {
          return value?.validatePassword();
        },
        suffix: IconButton(
            onPressed: () {
              controller.showOrHidePasswordVisibility();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: controller.obsecurePassword
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.visibility,
                    color: appColor,
                  )),
        focusNode: controller.passwordFocusNode);
  }

  _confirmPasswordFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Confirm Password",
        labletext: "Confirm Password",
        maxLines: 1,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context).unfocus();
        },
        controller: controller.confirmPasswordController,
        obsecureText: controller.obsecureConfirmPassword,
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        validator: (value) {
          return value?.validateConfirmPassword(
              password: controller.passwordController.text);
        },
        suffix: IconButton(
            onPressed: () {
              controller.showOrHideConfirmPasswordVisibility();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: controller.obsecureConfirmPassword
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.visibility,
                    color: appColor,
                  )),
        focusNode: controller.confirmPasswordFocusNode);
  }

  _emergencyContactFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Emergency Contact",
        labletext: "Emergency Contact",
        controller: controller.emergencyContactController,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.emergencyContactFocusNode2);
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Enter Emergency Contact");
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
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
                boxDecoration: const BoxDecoration(color: Colors.transparent),
                showCountryOnly: true,
                onChanged: (value) {
                  controller.emgContactCodeVal = value.dialCode.toString();
                  controller.update();
                })),
        suffix: _verifyPhoneButton(
            onTap: () => controller.getVerifyContactApi(
                controller.emgContactCodeVal +
                    controller.emergencyContactController.text,
                2),
            text: isVerifyContact2 ? "Verified" : "Verify"),
        focusNode: controller.emergencyContactFocusNode);
  }

  _verifyPhoneButton({Function()? onTap, text}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: BalooStyles.baloosemiBoldTextStyle(color: Colors.green),
        textAlign: TextAlign.center,
      ).paddingOnly(right: 10, top: 15),
    );
  }

  _emergencyContactFieldView2({required BuildContext context}) {
    return CustomTextField(
        hintText: "2nd Emergency Contact",
        labletext: "2nd Emergency Contact",
        controller: controller.emergencyContactController2,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.bloodGroupFocusNode);
        },
        validator: (value) {
          return value?.isEmptyField(
              messageTitle: "Enter Second Emergency Contact");
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        suffix: _verifyPhoneButton(
            onTap: () => controller.getVerifyContactApi(
                controller.emgContactCodeVal2 +
                    controller.emergencyContactController2.text,
                3),
            text: isVerifyContact3 ? "Verified" : "Verify"),
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
                boxDecoration: const BoxDecoration(color: Colors.transparent),
                showCountryOnly: true,
                onChanged: (value) {
                  controller.emgContactCodeVal2 = value.dialCode.toString();
                  controller.update();
                })),
        focusNode: controller.emergencyContactFocusNode2);
  } // emergency Contact details form

  _dobFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Date of Birth",
        labletext: "Date of Birth",
        readOnly: true,
        controller: controller.dobController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.bloodGroupFocusNode);
        },
        onTap: () => controller.selectDate(Get.context!),
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Select Date of Birth");
        },
        focusNode: controller.dobFocusNode);
  }

  _bloodGroupFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Blood Group",
        labletext: "Blood Group",
        controller: controller.bloodGroupController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context).unfocus();
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Enter Blood Group");
        },
        focusNode: controller.bloodGroupFocusNode);
  }

  _genderView({required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender' ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(left: 2, bottom: 5),
        Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100,
                boxShadow: lightShadow),
            child: verticalDot(context)),
      ],
    );
  }

  verticalDot(context) {
    return DropdownButton(
        elevation: 1,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsets.zero,
        value: controller.dropDownValue,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: controller.genderType.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: SizedBox(
                width: Get.width,
                child: Text(items, style: BalooStyles.baloonormalTextStyle())),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.dropDownValue = newValue ?? '';
          // storage.write(USERType, controller.dropDownValue);
          print("storage.read(userType)");
          print(storage.read(controller.dropDownValue));
          controller.update();
        });
  }

  void _onSignUpPressed() {
    if (formGlobalKey.currentState!.validate()) {
      Get.find<RegisterController>().hitRegisterAPI();
    }
  }
}
