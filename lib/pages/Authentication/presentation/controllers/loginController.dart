import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/services/network_exception.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

import '../../../../main.dart';
import '../../../../services/login_service.dart';

class LoginController extends GetxController {

  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode loginFocusNode;
  String countryCodeVal = '+91';
  bool obsecurePassword = true;
  bool isRememberMe = false;
  RegisterResponseModel loginModel = RegisterResponseModel();

  @override
  void onInit() {
    phoneController = TextEditingController();

    passwordController = TextEditingController();
    phoneFocusNode = FocusNode();

    passwordFocusNode = FocusNode();
    loginFocusNode = FocusNode();

    super.onInit();
  }

  @override
  void onClose() {
    customLoader.hide();
    phoneController.dispose();
    passwordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    loginFocusNode.dispose();

    super.onClose();
  }

//   @override
// void dispose(){
//     _focusNode.dispose();
//     super.dispose();
// }
  @override
  void onReady() {}

  /*===================================================================== Password Visibility  ==========================================================*/
  showOrHidePasswordVisibility() {
    obsecurePassword = !obsecurePassword;
    update();
  }

  /*===================================================================== Login API Call  ==========================================================*/
  hitLoginAPI() {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    var loginReq = {
      "email_or_phone": "${countryCodeVal}${phoneController.text.trim()}",
      "password": passwordController.text
    };
    Get.find<AuthenticationApiService>()
        .loginApiCall(dataBody: loginReq)
        .then((value) async {
      customLoader.hide();
      loginModel = value;
      toast(loginModel.message);
      storage.write(LOCALKEY_token, loginModel.accessToken ?? "");
      storage.write(userId, loginModel.userDetails?.id.toString() ?? "");
      storage.write(RefreshToken, loginModel.refreshToken ?? "");
      storage.write(isFirstTime, false);
      print("isVerifiedQr: $isVerifiedQr, isSubscribed: $isSubscribed");
      if (storage.read(isVerifiedQr) == true &&
          (storage.read(isSubscribed) == true)) {
        Get.toNamed(AppRoutes.homeScreen);
        customLoader.hide();
      } else {
        // Get.toNamed(AppRoutes.qrScreen);
        Get.toNamed(AppRoutes.homeScreen);
        customLoader.hide();
      }
      update();
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error.toString());
    });
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/constants/local_keys.dart';
// import 'package:moto_park/navigation/navigation.dart';
// import 'package:moto_park/response_model/register_response_model.dart';
// import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
// import 'package:moto_park/utilities/custom_flashbar.dart';
// import '../../../../main.dart';

// class LoginController extends GetxController {
//   late TextEditingController phoneController;
//   late TextEditingController passwordController;
//   late FocusNode phoneFocusNode;
//   late FocusNode passwordFocusNode;
//   late FocusNode loginFocusNode;
//   String countryCodeVal = '+91';
//   bool obsecurePassword = true;
//   bool isRememberMe = false;
//   RegisterResponseModel loginModel = RegisterResponseModel();

//   @override
//   void onInit() {
//     phoneController = TextEditingController();
//     passwordController = TextEditingController();
//     phoneFocusNode = FocusNode();
//     passwordFocusNode = FocusNode();
//     loginFocusNode = FocusNode();
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     phoneController.dispose();
//     passwordController.dispose();
//     phoneFocusNode.dispose();
//     passwordFocusNode.dispose();
//     loginFocusNode.dispose();
//     super.onClose();
//   }

//   void showOrHidePasswordVisibility() {
//     obsecurePassword = !obsecurePassword;
//     update();
//   }

//   void hitLoginAPI() {
//     customLoader.show();
//     FocusManager.instance.primaryFocus!.unfocus();
//     var loginReq = {
//       "email_or_phone": countryCodeVal + phoneController.text.trim(),
//       "password": passwordController.text
//     };
//     Get.find<AuthenticationApiService>()
//         .loginApiCall(dataBody: loginReq)
//         .then((value) async {
//       customLoader.hide();
//       loginModel = value;

//       storage.write(LOCALKEY_token, loginModel.accessToken ?? "");
//       storage.write(RefreshToken, loginModel.accessToken ?? "");
//       storage.write(isFirstTime, false);
//       storage.write(LoginModelStKey, loginModel.userDetails);

//       // _showSuccessDialog();

//       if (storage.read(isVerifiedQr) == true &&
//           (storage.read(isSubscribed) == true)) {
//         Get.offAllNamed(AppRoutes.homeScreen);
//       } else {
//         Get.offAllNamed(AppRoutes.homeScreen);
//       }
//     }).onError((error, stackTrace) {
//       customLoader.hide();
//       // _showErrorDialog(error.toString());
//     });
//   }

//   // void _showSuccessDialog() {
//   //   showDialog(
//   //     context: Get.context!,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text("Login Successful"),
//   //         content: Text("You have successfully logged in."),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             child: Text("OK"),
//   //             onPressed: () {
//   //               Get.back(); // Close the dialog
//   //             },
//   //           )
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }

//   // void _showErrorDialog(String errorMessage) {
//   //   showDialog(
//   //     context: Get.context!,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text("Login Failed"),
//   //         content: Text(errorMessage),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             child: Text("OK"),
//   //             onPressed: () {
//   //               Get.back(); // Close the dialog
//   //             },
//   //           )
//   //         ],
//   //       );
//   //     },
//   //   );
//   }

