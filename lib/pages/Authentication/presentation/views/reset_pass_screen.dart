import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/change_password_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/reset_pass_controller.dart';
import 'package:moto_park/utilities/common_textfield.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:moto_park/Extension/text_field_extenstion.dart';

import '../../../../constants/color_constants.dart';
import '../../../../utilities/const_string.dart';

class ResetPassScreen extends GetView<ResetPassController> {
  ResetPassScreen({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: InkWell(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(.9),
          body: GetBuilder<ChangePasswordController>(builder: (controller) {
            return _mainBody();
          }),
        ),
      ),
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
                      height: Get.height * .5,
                      decoration: const BoxDecoration(
                          color: appColor,
                          // color: appColor,
                          // gradient: appBarGradient(),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(60, 0, 60, 80),
                          child: Image.asset(appIcon)))),
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Container(
                  height: Get.height * .52,
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
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                    children: [
                      _form(),
                      vGap(50),
                      GradientButton(
                        onTap: () {
                          if (formGlobalKey.currentState!.validate()) {
                            print("sdjf");
                            if (controller.isForgotPass) {
                              controller.forgotPassAPiCall();
                            } else {
                              controller.changePassAPiCall();
                            }
                          }
                        },
                        name: "Reset Password",
                      ).marginOnly(bottom: 0),
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
                      "Reset Password",
                      style: BalooStyles.baloosemiBoldTextStyle(
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    vGap(10),
                    Text(
                      "Create a new password and never share it with anyone for safe use.",
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
          controller.isForgotPass
              ? Container()
              : CustomTextField(
              hintText: "New Password",
              maxLines: 1,
              controller: controller.oldPasswordController,
              obsecureText: !controller.viewOldPassword,
              validator: (value) {
                return value?.validatePassword();
              },
              suffix: IconButton(
                  onPressed: () {
                    controller.showOrHideOldPasswordVisibility();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    !controller.viewOldPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: !controller.viewOldPassword
                        ? Colors.grey
                        : appColor,
                  )),
              onFieldSubmitted: (String? value) {
                FocusScope.of(Get.context!)
                    .requestFocus(controller.passwordFocusNode);
              },
              focusNode: controller.oldpasswordFocusNode),
          vGap(0),
          CustomTextField(
              hintText: "Confirm New Password",
              maxLines: 1,
              controller: controller.passwordController,
              obsecureText: !controller.viewPassword,
              validator: (value) {
                return value?.validatePassword();
              },
              suffix: IconButton(
                  onPressed: () {
                    controller.showOrHidePasswordVisibility();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    !controller.viewPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: !controller.viewPassword ? Colors.grey : appColor,
                  )),
              onFieldSubmitted: (String? value) {
                FocusScope.of(Get.context!)
                    .requestFocus(controller.confirmPasswordFocusNode);
              },
              focusNode: controller.passwordFocusNode),

        ],
      ),
    );
  }
}
