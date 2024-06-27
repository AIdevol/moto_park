import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/response_model/vehical_list_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
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

 fetchVehicleDetails() {
    customLoader.show();

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
