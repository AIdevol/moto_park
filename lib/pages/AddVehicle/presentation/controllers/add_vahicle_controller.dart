// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/response_model/vehical_list_model.dart';
// import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
// import 'package:moto_park/services/APIs/post/post_api_service_impl.dart';
//
// import '../../../../constants/local_keys.dart';
// import '../../../../main.dart';
// import '../../../../navigation/navigation.dart';
// import '../../../../utilities/custom_flashbar.dart';
//
// class AddVehicleController extends GetxController {
//   late TextEditingController registrationNumberController;
//   late TextEditingController brandController;
//   late TextEditingController modelController;
//   late FocusNode brandFocusNode;
//   late FocusNode modelFocusNode;
//   late FocusNode rgFocusNode;
// VehicleListModel vehicleListModel = VehicleListModel();
//   // List<VehicleListModel> vehicleList = [];
//
//   List<String> vehicleType = [
//     "Auto",
//     "E-Rickshaw",
//     "Motorcycles",
//     "Cars",
//     "Trucks",
//     "Buses",
//     "Others",
//   ];
//   String dropDownValue = "Cars";
//
//
//   @override
//   void onInit() {
//     registrationNumberController = TextEditingController();
//     brandController = TextEditingController();
//     modelController = TextEditingController();
//     rgFocusNode = FocusNode();
//     brandFocusNode = FocusNode();
//     modelFocusNode = FocusNode();
//
//     super.onInit();
//   }
//
//   addVehicleApiCall() {
//     customLoader.show();
//     FocusManager.instance.primaryFocus!.unfocus();
//     if (brandController.text.isEmpty ||
//         modelController.text.isEmpty ||
//         registrationNumberController.text.isEmpty ||
//         rgFocusNode.hasFocus == false) {
//       Get.snackbar(
//         "error",
//         "Every field must be  filled",
//         snackPosition: SnackPosition.TOP,
//       );
//       customLoader.hide();
//       return;
//     }
//     var loginReq = {
//       "model_number": modelController.text,
//       "registration_number": registrationNumberController.text,
//       "vehicle_type": dropDownValue,
//       "images": '',
//       "user": '1',
//     };
//     Get.find<AuthenticationApiService>()
//         .addVehicledetailsApicall(dataBody: loginReq)
//         .then((value) async {
//       vehicleListModel = value;
//       customLoader.hide();
//       // toast(responsemodel.message);
//       toast(vehicleListModel.id);
//       toast(vehicleListModel.modelNumber);
//       toast(vehicleListModel.registrationNumber);
//       toast(vehicleListModel.vehicleType);
//       toast(vehicleListModel.user);
//       // storage.write(LOCALKEY_token, value.accessToken);
//       // storage.write(RefreshToken, value.accessToken);
//       // storage.write(LoginModelStKey, value.userDetails);
//       storage.write(isFirstTime, false);
//       Get.offAllNamed(AppRoutes.addVehicle);
//       Get.offAndToNamed(AppRoutes.homeScreen);
//     }).onError((error, stackTrace) {
//       customLoader.hide();
//       Get.toNamed(AppRoutes.homeScreen);
//       toast(error.toString());
//     });
//   }
//   //
//   // void updateVehicleDetails() {}
//
//   void nextFocus() {}
// }
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:moto_park/constants/local_keys.dart';
// // import 'package:moto_park/navigation/navigation.dart';
// // import 'package:moto_park/response_model/register_response_model.dart';
// // import 'package:moto_park/response_model/vehical_list_model.dart';
// // import 'package:moto_park/services/APIs/post/post_api_service_impl.dart';
// // import 'package:moto_park/utilities/custom_flashbar.dart';
//
// // import '../../../../main.dart';
//
// // class AddVehicleController extends GetxController {
// //   late TextEditingController registrationNumberController;
// //   late TextEditingController brandController;
// //   late TextEditingController modelController;
// //   late FocusNode brandFocusNode;
// //   late FocusNode modelFocusNode;
// //   late FocusNode rgFocusNode;
//
// //   List<VehicleListModel> vehicleList = [];
//
// //   List<String> vehicleType = [
// //     "Auto",
// //     "E-Rickshaw",
// //     "Motorcycles",
// //     "Cars",
// //     "Trucks",
// //     "Buses",
// //     "Others",
// //   ];
// //   String dropDownValue = "Cars";
//
// //   @override
// //   void onInit() {
// //     registrationNumberController = TextEditingController();
// //     brandController = TextEditingController();
// //     modelController = TextEditingController();
// //     rgFocusNode = FocusNode();
// //     brandFocusNode = FocusNode();
// //     modelFocusNode = FocusNode();
// //     super.onInit();
// //   }
//
// //   @override
// //   void onClose() {
// //     registrationNumberController.dispose();
// //     brandController.dispose();
// //     modelController.dispose();
// //     rgFocusNode.dispose();
// //     brandFocusNode.dispose();
// //     modelFocusNode.dispose();
// //     super.onClose();
// //   }
//
// //   void addVehicleApiCall() {
// //     if (_validateFields()) {
// //       customLoader.show();
// //       FocusManager.instance.primaryFocus!.unfocus();
// //       var loginReq = {
// //         "model_number": modelController.text,
// //         "registration_number": registrationNumberController.text,
// //         "vehicle_type": dropDownValue,
// //         "images": '',
// //         "user": '1',
// //       };
// //       Get.find<PostApiServiceImpl>()
// //           .postVehicleApiCall(dataBody: loginReq)
// //           .then((value) async {
// //         vehicleList = value;
// //         customLoader.hide();
// //         toast(RegisterResponseModel.message);
// //         _saveUserDetails(value);
// //         Get.offAllNamed(AppRoutes.addVehicle);
// //       }).catchError((error) {
// //         customLoader.hide();
// //         toast(error.toString());
// //       });
// //     }
// //   }
//
// //   bool _validateFields() {
// //     if (brandController.text.isEmpty ||
// //         modelController.text.isEmpty ||
// //         registrationNumberController.text.isEmpty ||
// //         !rgFocusNode.hasFocus) {
// //       Get.snackbar(
// //         "Error",
// //         "Every field must be filled",
// //         snackPosition: SnackPosition.TOP,
// //       );
// //       return false;
// //     }
// //     return true;
// //   }
//
// //   void _saveUserDetails(dynamic value) {
// //     storage.write(LOCALKEY_token, value.accessToken);
// //     storage.write(RefreshToken, value.accessToken);
// //     storage.write(LoginModelStKey, value.userDetails);
// //     storage.write(isFirstTime, false);
// //   }
//
// //   void updateVehicleDetails() {
// //     // Implement update vehicle details functionality
// //   }
//
// //   void nextFocus() {
// //     // Implement next focus functionality
// //   }
// // }
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/response_model/vehical_list_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

import '../../../../main.dart';

class AddVehicleController extends GetxController {
  late TextEditingController registrationNumberController;
  late TextEditingController brandController;
  late TextEditingController modelController;
  late FocusNode brandFocusNode;
  late FocusNode modelFocusNode;
  late FocusNode rgFocusNode;



  List<String> vehicleType = [
    "Auto",
    "E-Rickshaw",
    "Motorcycles",
    "Cars",
    "Trucks",
    "Buses",
    "Others",
  ];
  String dropDownValue = "Cars";

  @override
  void onInit() {
    super.onInit();
    registrationNumberController = TextEditingController();
    brandController = TextEditingController();
    modelController = TextEditingController();
    rgFocusNode = FocusNode();
    brandFocusNode = FocusNode();
    modelFocusNode = FocusNode();
  }

  @override
  void onClose() {
    registrationNumberController.dispose();
    brandController.dispose();
    modelController.dispose();
    rgFocusNode.dispose();
    brandFocusNode.dispose();
    modelFocusNode.dispose();
    super.onClose();
  }

  void addVehicleApiCall() {
    if (_validateFields()) {
      customLoader.show();
      FocusManager.instance.primaryFocus?.unfocus();

      final loginReq = {
        "model_number": modelController.text,
        "registration_number": registrationNumberController.text,
        "vehicle_type": dropDownValue,
        "images": '',
        "user": userId,
      };

      Get.find<AuthenticationApiService>()
          .addVehicledetailsApicall(userId, dataBody: loginReq)
          .then((vehicleListModel) {
        toast(vehicleListModel.id?.toString() ?? 'Failed to get vehicle ID');
        customLoader.hide();
        toast("Vehicle added successfully");
      }).catchError((error) {
        customLoader.hide();
        toast('Error occurred: $error');
      });
    }
  }

  bool _validateFields() {
    if (brandController.text.isEmpty ||
        modelController.text.isEmpty ||
        registrationNumberController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Every field must be filled",
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
    return true;
  }
}