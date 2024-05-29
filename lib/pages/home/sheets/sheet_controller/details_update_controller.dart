import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/response_model/vehical_list_model.dart';
import 'package:moto_park/services/APIs/post/post_api_service_impl.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

class ShowVehicleController extends GetxController {
  late TextEditingController registrationNumberController;
  late TextEditingController brandController;
  late TextEditingController modelController;
  late FocusNode brandFocusNode;
  late FocusNode modelFocusNode;
  late FocusNode rgFocusNode;

  List<VehicleListModel> vehicleList = [];

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
    registrationNumberController = TextEditingController();
    brandController = TextEditingController();
    modelController = TextEditingController();
    rgFocusNode = FocusNode();
    brandFocusNode = FocusNode();
    modelFocusNode = FocusNode();

    super.onInit();

    addVehicleApiCall() {
      customLoader.show();
      FocusManager.instance.primaryFocus?.unfocus();
      if (brandController.text.isEmpty ||
          modelController.text.isEmpty ||
          registrationNumberController.text.isEmpty ||
          rgFocusNode.hasFocus == false) {
        customLoader.hide();
        return;
      }
      var loginReq = {
        "model_number": modelController.text,
        "registration_number": registrationNumberController.text,
        "vehicle_type": dropDownValue,
        "images": '',
        "user": '1',
      };
      // Get.find<PostApiServiceImpl>()
      //     .postVehicleApiCall(dataBody: loginReq)
      //     .then((value) async {
      //   vehicleList = value;
      //   customLoader.hide();
      //   toast(registerResponseModel.message);
      //   storage.write(LOCALKEY_token, value.accessToken);
      //   storage.write(RefreshToken, value.accessToken);
      //   storage.write(LoginModelStKey, value.userDetails);
      //   storage.write(isFirstTime, false);
      //   Get.offAllNamed(AppRoutes.addVehicle);
      //   // Get.offAndToNamed(AppRoutes.homeScreen);
      // }).onError((error, stackTrace) {
      //   customLoader.hide();
      //   toast(error.toString());
      // });snackPosition: SnackPosition.TOP
    }
  }
}
