import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/response_model/vehical_list_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/services/vehicle_services.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';
import '../../../../main.dart';

class ShowVehicleController extends GetxController {
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

    fetchVehicleDetails();
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

  String? getVehicleId() {
    return storage.read('vehicleId');
  }

 fetchVehicleDetails() {
    customLoader.show();
    String? vehicleId = getVehicleId();


    // String? userid = await storage.read(userId);
    //
    // if (LOCALKEY_token == null || userid == null) {
    //   customLoader.hide();
    //   toast('User not authenticated');
    //   return;
    // }

    Get.find<AuthenticationApiService>()
        .getVehicleDetailsApiCall(vehicleId)
        .then((vehicleDetails) {
      customLoader.hide();
      if (vehicleDetails != null) {
        brandController.text = vehicleDetails.brandName ?? '';
        modelController.text = vehicleDetails.modelNumber ?? '';
        registrationNumberController.text = vehicleDetails.registrationNumber ?? '';
        dropDownValue = vehicleDetails.vehicleType ?? 'Cars';
        update();
        toast("Vehicle details fetched successfully");
      } else {
        toast("Failed to fetch vehicle details");
      }
    }).catchError((error) {
      customLoader.hide();
      toast('Error occurred: $error');
    });
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/constants/local_keys.dart';
// import 'package:moto_park/response_model/vehical_list_model.dart';
// import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
// import 'package:moto_park/utilities/custom_flashbar.dart';
// import '../../../../main.dart';
//
// class ShowVehicleController extends GetxController {
//   TextEditingController registrationNumberController = TextEditingController();
//   TextEditingController brandController = TextEditingController();
//   TextEditingController modelController = TextEditingController();
//   FocusNode brandFocusNode = FocusNode();
//   FocusNode modelFocusNode = FocusNode();
//   FocusNode rgFocusNode = FocusNode();
//
//   var vehicleType = [
//     "Auto",
//     "E-Rickshaw",
//     "Motorcycles",
//     "Cars",
//     "Trucks",
//     "Buses",
//     "Others",
//   ];
//
//   var dropDownValue = "Cars".obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchVehicleDetails();
//   }
//
//   @override
//   void onClose() {
//     registrationNumberController.dispose();
//     brandController.dispose();
//     modelController.dispose();
//     rgFocusNode.dispose();
//     brandFocusNode.dispose();
//     modelFocusNode.dispose();
//     super.onClose();
//   }
//
//   String? getVehicleId() {
//     return storage.read('vehicleId');
//   }
//
//   void fetchVehicleDetails() async {
//     customLoader.show();
//     String? vehicleId = getVehicleId();
//
//     if (vehicleId == null) {
//       customLoader.hide();
//       toast('Vehicle ID not found');
//       return;
//     }
//
//     try {
//       VehicleListModel vehicleDetails = await Get.find<AuthenticationApiService>().getVehicleDetailsApiCall(vehicleId);
//       customLoader.hide();
//       if (vehicleDetails != null) {
//         brandController.text = vehicleDetails.brandName ?? '';
//         modelController.text = vehicleDetails.modelNumber ?? '';
//         registrationNumberController.text = vehicleDetails.registrationNumber ?? '';
//         dropDownValue.value = vehicleDetails.vehicleType ?? 'Cars';
//         update();
//         toast("Vehicle details fetched successfully");
//       } else {
//         toast("Failed to fetch vehicle details");
//       }
//     } catch (error) {
//       customLoader.hide();
//       toast('Error occurred: $error');
//     }
//   }
// }
