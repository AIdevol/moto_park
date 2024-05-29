import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/otp_verfied_controller.dart';
import 'package:moto_park/utilities/const_string.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerfiedScreen extends GetView<OtpVerifiedController> {
  final formGlobalKey = GlobalKey<FormState>();
  final OtpVerifiedController controller = Get.put(OtpVerifiedController());
  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(.9),
        body: GetBuilder<OtpVerifiedController>(builder: (controller) {
          return _mainBody();
        }),
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
                      height: Get.height * .53,
                      decoration: const BoxDecoration(
                          color: appColor,
                          // color: appColor,
                          // gradient: appBarGradient(),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(60, 0, 60, 70),
                          child: Image.asset(appIcon)))),
              Positioned(
                left: 15,
                right: 15,
                bottom: 30,
                child: Container(
                    height:
                        Get.height < 650 ? Get.height * .44 : Get.height * .5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade500, blurRadius: 7)
                        ]),
                    padding: const EdgeInsets.all(0),
                    child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        children: [
                          OTPTextField(
                            length: 6,
                            controller: controller.otpFieldController,
                            width: Get.width,
                            fieldWidth: 45,
                            fieldStyle: FieldStyle.box,
                            style: const TextStyle(fontSize: 17),
                            onChanged: (val) {
                              controller.otpVal = val;
                              if (val.length == 6) {
                                print("OTP Entered: $val");
                                // Only call API when OTP is fully entered, and update UI to indicate the operation
                                controller.isfill = true;
                                controller.update();
                                Future.delayed(Duration.zero, () {
                                  controller.emailHitOtpAPI(otp: val);
                                });
                              } else {
                                controller.isfill = false;
                                controller
                                    .update(); // Update if you want immediate feedback for each digit
                              }
                            },
                            // onCompleted: (val) {
                            //   print("OTP Entered: $val");
                            //   if (val.length == 6) {
                            //     print("Error: OTP value is null");

                            //     return;
                            //   }
                            //   controller.isfill != false;
                            //   controller.otpVal = val;
                            //   controller.update();
                            //   controller.hitOtpAPI(otp: val);
                            // },
                            // onChanged: (val) {
                            //   if (val.length == 6) {
                            //     print("OTP Entered: $val");
                            //     if (val == null) {
                            //       print("Error: OTP value is null");
                            //       return;
                            //     }
                            //     controller.isfill = true;
                            //     controller.otpVal = val;
                            //     controller.update();
                            //     controller.hitOtpAPI(otp: val);
                            //   }
                            // },
                            otpFieldStyle: OtpFieldStyle(
                              backgroundColor: Colors.white,
                              enabledBorderColor: Colors.grey.shade300,
                              borderColor: Colors.grey.shade300,
                              focusBorderColor: appColor,
                            ),
                          ),
                          resendOTPView(),
                          Center(
                            child: Text(
                              '${controller.secondsRemaining}',
                              style: BalooStyles.baloosemiBoldTextStyle(
                                  color: appColor, size: 18),
                            ),
                          ),
                          vGap(20),
                          GradientButton(
                            onTap: controller.isfill
                                ? () {
                                    if (formGlobalKey.currentState
                                            ?.validate() ??
                                        false) {
                                      controller.hitOtpAPI(
                                          otp: controller.otpVal);
                                    }
                                  }
                                : () {},
                            btnColor: controller.isfill
                                ? appColor
                                : Colors.grey.shade300,
                            name: 'Submit',
                          ).marginOnly(bottom: 20),
                        ])),
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
                      "Verification",
                      style: BalooStyles.baloosemiBoldTextStyle(
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    vGap(10),
                    Text(
                      "Enter OTP, that is sent to your registered mobile number.",
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

  Widget resendOTPView() {
    return Text.rich(
      TextSpan(
          text: "Didn't receive the OTP? ".tr,
          style:
              BalooStyles.baloonormalTextStyle(size: 14, color: Colors.black45),
          children: [
            TextSpan(
              text: "Resend Now".tr,
              recognizer: new TapGestureRecognizer()
                ..onTap =
                    controller.enableResend ? controller.resendCode : null,
              style: BalooStyles.balooboldTextStyle(
                  size: 14,
                  color: controller.enableResend ? appColor : Colors.grey),
            ),
          ]),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ).paddingSymmetric(vertical: 30, horizontal: 0);
  }

  titleSubtileView() {
    return Text.rich(
      TextSpan(
          text: "Please Check your Phone. We've sent you the code at",
          style: BalooStyles.baloomediumTextStyle(),
          children: [
            TextSpan(
              text: " ${controller.phone}",
              style: BalooStyles.baloomediumTextStyle(),
            ),
          ]),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
