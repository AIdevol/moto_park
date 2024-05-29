import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/loginController.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/registerController.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

import '../../../../main.dart';

class ForgotPassController extends GetxController {
  late TextEditingController emailController;
  String countryCodeVal = '+91';
  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    customLoader.hide();
    emailController.dispose();

    super.onClose();
  }

  void forgotPasswordApiCall() {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    var loginReq = {"email": emailController.text};
    Get.find<AuthenticationApiService>()
        .forgotPassword(dataBody: loginReq)
        .then((value) async {
      customLoader.hide();
      toast(value.rOtp, seconds: 15);
      Get.toNamed(AppRoutes.otpScreen, arguments: {
        "OTP": value.rOtp,
        "PHONE": emailController.text,
        "Type": 0,
        "email": true
      });
      Get.put(LoginController());
      Get.put(RegisterController());
      // Get.offAllNamed(AppRoutes.login);
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error.toString());
    });
  }
}
