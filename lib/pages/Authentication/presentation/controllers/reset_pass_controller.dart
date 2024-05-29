import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

class ResetPassController extends GetxController {
  late TextEditingController passwordController;
  late TextEditingController oldPasswordController;
  late FocusNode oldpasswordFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  bool viewPassword = false;
  bool viewOldPassword = false;
  late TextEditingController confirmPasswordController;
  bool viewConfirmPassword = false;

  bool isForgotPass = false;

  String emailAd = '';

  @override
  void onInit() {
    userDetails = storage.read(LoginModelStKey) ?? {};
    if (Get.arguments != null) {
      isForgotPass = Get.arguments['forgot']?? false;
      emailAd = Get.arguments['email']?? "";
    }
    oldPasswordController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordFocusNode = FocusNode();
    oldpasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    super.onInit();
  }

  showOrHidePasswordVisibility() {
    viewPassword = !viewPassword;
    update();
  }

  showOrHideOldPasswordVisibility() {
    viewOldPassword = !viewOldPassword;
    update();
  }

  showOrHideConfirmPasswordVisibility() {
    viewConfirmPassword = !viewConfirmPassword;
    update();
  }

  // var userDetails;
  late Map<String, dynamic> userDetails;

  void changePassAPiCall() {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    var loginReq = {
      "email_or_phone": userDetails['email'],
      "old_password": oldPasswordController.text,
      "new_password": passwordController.text,
      "confirm_new_password": confirmPasswordController.text
    };
    Get.find<AuthenticationApiService>()
        .changePassEmail(dataBody: loginReq)
        .then((value) async {
      customLoader.hide();
      toast(value.message);
      Get.back();
      //  Get.put(LoginController());
      //  Get.put(RegisterController());
      // Get.offAllNamed(AppRoutes.login);
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error.toString());
    });
  }

  void forgotPassAPiCall() {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    var loginReq = {
      "new_password": passwordController.text,
      "confirm_new_password": confirmPasswordController.text
    };
    Get.find<AuthenticationApiService>()
        .changePassEmail(dataBody: loginReq, email: emailAd)
        .then((value) async {
      customLoader.hide();
      toast(value.message);
      Get.toNamed(AppRoutes.login);
      //  Get.put(LoginController());
      //  Get.put(RegisterController());
      // Get.offAllNamed(AppRoutes.login);
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error.toString());
    });
  }
}
