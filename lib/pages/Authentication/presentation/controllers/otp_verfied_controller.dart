import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/registerController.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OtpVerifiedController extends GetxController {
  late OtpFieldController otpFieldController;
  String otp = "";
  String phone = "";
  String email = "";
  bool isFromForgotScreen = true;
  int type = 0;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  bool isEmailVerify = false;
  String otpVal = '';

  bool isfill = false;

  @override
  void onInit() {
    otpFieldController = OtpFieldController();
    print("++++");
    // isFromForgotScreen = Get.arguments[RoutesArgument.isFromForgotScreen];
    if (Get.arguments == null ||
        !Get.arguments.containsKey('OTP') ||
        !Get.arguments.containsKey('email')) {
      print('Required arguments are missing');

      return;
    }
    otp = Get.arguments['OTP'];
    phone = Get.arguments['PHONE'];
    type = Get.arguments['Type'];
    isEmailVerify = Get.arguments['email'];
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        update();
      } else {
        enableResend = true;
        update();
      }
    });
    // email = Get.arguments[RoutesArgument.emailKey];

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void resendCode() {
    secondsRemaining = 30;
    enableResend = false;
    update();
  }

  // hitOtpAPI({otp}) {
  //   // customLoader.show();
  //   // FocusManager.instance.primaryFocus!.unfocus();
  //   // Map<String,dynamic> data = {
  //   //   "otp_number": otp,
  //   //   "email_id": emailId
  //   // };
  //   // Get.find<AuthApiServiceImpl>().sendOtpApiCall(dataBody: data, secretKey: storage.read(user_key)).then((value) async {
  //   //   customLoader.hide();
  //   //   toast(value.message);
  //   //   if(value.statusCode==200) {
  //   //     Get.toNamed(AppRoutes.resetPassword, arguments: {'email': emailId});
  //   //   }
  //   // }).onError((error, stackTrace) {
  //   //   customLoader.hide();
  //   //   toast(error);
  //   // }
  //   // );
  // }

  //
  hitOtpAPI({required String otp}) {
    customLoader.show();
    FocusManager.instance.primaryFocus?.unfocus();

    var verifyOtpReq = {"otp": otp};
    print("Requesting OTP verification with: $verifyOtpReq");

    Get.find<AuthenticationApiService>()
        .otpApiCall(dataBody: verifyOtpReq, phone: phone)
        .then((value) async {
      customLoader.hide();

      if (value.accessToken != null) {
        toast(value.message ?? "OTP verification successful");
        print("OTP verification successful, message: ${value.message}");

        switch (type) {
          case 1:
            isVerifyContact1 = true;
            break;
          case 2:
            isVerifyContact2 = true;
            break;
          case 3:
            isVerifyContact3 = true;
            break;
        }

        update();
        Get.find<RegisterController>().update();
        Get.offAllNamed(AppRoutes.resetpass,
            arguments: {"forgot": true, 'phone': phone});
      } else {
        toast(value.message ?? "OTP verification failed");
        print("OTP verification failed, message: ${value.message}");
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      Get.offAllNamed(AppRoutes.resetpass);
      toast(error.toString());
      print("OTP verification failed, error: $error, stackTrace: $stackTrace");
    });
  }

  // emailHitOtpAPI() {
  //   customLoader.show();
  //   FocusManager.instance.primaryFocus?.unfocus();
  //
  //   var verifyOtpReq = {"otp": otp};
  //   print("Requesting Email OTP verification with: $verifyOtpReq");
  //
  //   Get.find<AuthenticationApiService>()
  //       .otpApiCallEmail(dataBody: verifyOtpReq, email: phone)
  //       .then((value) async {
  //     customLoader.hide();
  //
  //     if (value.accessToken != null) {
  //       toast(value.message ?? "Email OTP verification successful");
  //       print("Email OTP verification successful, message: ${value.message}");
  //       Get.toNamed(AppRoutes.changePassword,
  //           arguments: {"forgot": true, 'email': phone});
  //     } else {
  //       toast(value.message ?? "Email OTP verification failed");
  //       print("Email OTP verification failed, message: ${value.message}");
  //     }
  //   }).onError((error, stackTrace) {
  //     customLoader.hide();
  //     toast(error.toString());
  //     print(
  //         "Email OTP verification failed, error: $error, stackTrace: $stackTrace");
  //   });
  // }
  emailHitOtpAPI({required String otp}) {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    var verifyOtpReq = {"otp": otp};
    Get.find<AuthenticationApiService>()
        .otpApiCallEmail(dataBody: verifyOtpReq, email: phone)
        .then((value) async {
      customLoader.hide();
      Get.toNamed(AppRoutes.resetpass,
          arguments: {"forgot": true, 'email': phone});
      toast(value.message);
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error);
    });
  }

  hitResendOtpAPI() {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    var loginReq = {
      "Phone": 'email',
    };
    Get.find<AuthenticationApiService>()
        .resendOtpApiCall(dataBody: loginReq)
        .then((value) async {
      // loginModel = value;
      customLoader.hide();
      // storage.write(LOCALKEY_token, loginModel?.data?.jWTTOKEN??"");

      toast(value.message ?? "", seconds: 5);
    }).onError((error, stackTrace) {
      customLoader.hide();

      toast(error);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/constants/local_keys.dart';
// import 'package:moto_park/main.dart';
// import 'package:moto_park/navigation/navigation.dart';
// import 'package:moto_park/pages/Authentication/presentation/controllers/registerController.dart';
// import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
// import 'package:moto_park/utilities/custom_flashbar.dart';
// import 'package:otp_text_field/otp_text_field.dart';

// class OtpVerifiedController extends GetxController {
//   late OtpFieldController otpFieldController;
//   String otp = "";
//   String phone = "";
//   bool isFromForgotScreen = true;
//   int type = 0;
//   int secondsRemaining = 30;
//   bool enableResend = false;
//   Timer? timer;

//   @override
//   void onInit() {
//     super.onInit();
//     otpFieldController = OtpFieldController();
//     if (Get.arguments == null || !Get.arguments.containsKey('OTP') || !Get.arguments.containsKey('phone')) {
//       print('Required arguments are missing');
//       return;
//     }
//     otp = Get.arguments['OTP'];
//     phone = Get.arguments['phone'];
//     type = Get.arguments['type'] ?? 0;  // Assuming default type as 0 if not specified
//     timer = Timer.periodic(Duration(seconds: 1), (_) {
//       if (secondsRemaining > 0) {
//         secondsRemaining--;
//         update();
//       } else {
//         enableResend = true;
//         timer?.cancel();  // Stop the timer when it's not needed
//         update();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   void resendCode() {
//     secondsRemaining = 30;
//     enableResend = false;
//     timer?.cancel();  // Reset the timer
//     timer = Timer.periodic(Duration(seconds: 1), (_) {  // Restart the timer
//       if (secondsRemaining > 0) {
//         secondsRemaining--;
//         update();
//       } else {
//         enableResend = true;
//         update();
//       }
//     });
//     update();
//     hitResendOtpAPI();  // Call API to resend OTP
//   }

//   void hitOtpAPI({required String otp}) {
//     customLoader.show();
//     FocusManager.instance.primaryFocus?.unfocus();
//     var verifyOtpReq = {"otp": otp, "phone": phone};
//     Get.find<AuthenticationApiService>().otpApiCall(dataBody: verifyOtpReq, phone: phone)
//         .then((response) {
//           customLoader.hide();
//           if (response.statusCode == 200) {
//             Get.offAllNamed(AppRoutes.changePassword, arguments: {"forgot": true, 'phone': phone});
//           } else {
//             toast("Failed to verify OTP: ${response.data}");
//           }
//         }).onError((error, stackTrace) {
//           customLoader.hide();
//           toast("Error during OTP verification: $error");
//         });
//   }

//   void hitResendOtpAPI() {
//     var loginReq = {"Phone": phone};
//     Get.find<AuthenticationApiService>().resendOtpApiCall(dataBody: loginReq)
//         .then((value) {
//           toast(value.message ?? "", seconds: 5);
//         }).onError((error, stackTrace) {
//           toast("Error during OTP resend: $error");
//         });
//   }
// }
