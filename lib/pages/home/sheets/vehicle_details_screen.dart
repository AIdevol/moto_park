// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/navigation/navigation.dart';
// import 'package:moto_park/pages/AddVehicle/presentation/controllers/add_vahicle_controller.dart';
// import 'package:moto_park/pages/home/sheets/sheet_controller/show_vehicle_details_controller.dart';
// import 'package:moto_park/utilities/gradient_button.dart';
// import 'package:moto_park/utilities/helper_widget.dart';
// import 'package:moto_park/utilities/google_font_text_style.dart';
// import 'package:moto_park/utilities/common_textfield.dart';
//
// class ShowVehicleScreen extends GetView<ShowVehicleController> {
//   final ShowVehicleController controller = Get.put(ShowVehicleController());
//
//   final GlobalKey<FormState> _addVKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: backAppBar(title: "Show Vehicle details"),
//       body: GetBuilder<ShowVehicleController>(
//         builder: (controller) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: _form(),
//               ),
//               GradientButton(
//                 name: "Update Qr",
//                 onTap: () {
//                   Get.toNamed(AppRoutes.qrScreen);
//                 },
//               ).marginOnly(bottom: 20, left: 20, right: 20),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _form() {
//     return Form(
//       key: _addVKey,
//       child: Column(
//         children: [
//           vGap(20),
//           _vehicleType(),
//           _brandFieldView(),
//           _modelFieldView(),
//           _registrationNumberFieldView(),
//         ],
//       ),
//     ).paddingSymmetric(horizontal: 15);
//   }
//
//   Widget _vehicleType() {
//     return Container(
//       width: Get.width,
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//       margin: const EdgeInsets.symmetric(horizontal: 0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.grey.shade100,
//         boxShadow: lightShadow,
//       ),
//       child: DropdownButton(
//           elevation: 1,
//           underline: const SizedBox(),
//           borderRadius: BorderRadius.circular(12),
//           padding: EdgeInsets.zero,
//           value: controller.dropDownValue,
//           isExpanded: true,
//           icon: const Icon(Icons.keyboard_arrow_down),
//           items: controller.vehicleType.map((String item) {
//             return DropdownMenuItem(
//               value: item,
//               child: SizedBox(
//                 width: Get.width,
//                 child: Text(
//                   item,
//                   style: BalooStyles.baloonormalTextStyle(),
//                 ),
//               ),
//             );
//           }).toList(),
//           onChanged: null),
//     );
//   }
//
//   Widget _brandFieldView() {
//     return CustomTextField(
//       hintText: "Brand",
//       controller: controller.brandController,
//       textInputType: TextInputType.name,
//       textInputAction: TextInputAction.next,
//       readOnly: true,
//       focusNode: controller.brandFocusNode,
//     );
//   }
//
//   Widget _modelFieldView() {
//     return CustomTextField(
//       hintText: "Model",
//       controller: controller.modelController,
//       textInputType: TextInputType.name,
//       textInputAction: TextInputAction.next,
//       readOnly: true,
//       focusNode: controller.modelFocusNode,
//     );
//   }
//
//   Widget _registrationNumberFieldView() {
//     return CustomTextField(
//       hintText: "Registration Number",
//       controller: controller.registrationNumberController,
//       textInputType: TextInputType.name,
//       textInputAction: TextInputAction.next,
//       readOnly: true,
//       focusNode: controller.rgFocusNode,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/home/sheets/sheet_controller/show_vehicle_details_controller.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/common_textfield.dart';

class ShowVehicleScreen extends GetView<ShowVehicleController> {
  final GlobalKey<FormState> _addVKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: backAppBar(title: "Show Vehicle details"),
      body: GetBuilder<ShowVehicleController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: _form(controller),
              ),
              GradientButton(
                name: "Update Qr",
                onTap: () {
                  Get.toNamed(AppRoutes.qrScreen);
                },
              ).marginOnly(bottom: 20, left: 20, right: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _form(ShowVehicleController controller) {
    return Form(
      key: _addVKey,
      child: Column(
        children: [
          vGap(20),
          _vehicleType(controller),
          _brandFieldView(controller),
          _modelFieldView(controller),
          _registrationNumberFieldView(controller),
        ],
      ),
    ).paddingSymmetric(horizontal: 15);
  }

  Widget _vehicleType(ShowVehicleController controller) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade100,
        boxShadow: lightShadow,
      ),
      child: Obx(() {
        return DropdownButton(
          elevation: 1,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(12),
          padding: EdgeInsets.zero,
          value: controller.dropDownValue.value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: controller.vehicleType.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: SizedBox(
                width: Get.width,
                child: Text(
                  item,
                  style: BalooStyles.baloonormalTextStyle(),
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            controller.dropDownValue.value = newValue as String;
          },
        );
      }),
    );
  }

  Widget _brandFieldView(ShowVehicleController controller) {
    return Obx(() {
      return CustomTextField(
        hintText: "Brand",
        controller: controller.brandController.value,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        readOnly: true,
        focusNode: controller.brandFocusNode.value,
      );
    });
  }

  Widget _modelFieldView(ShowVehicleController controller) {
    return Obx(() {
      return CustomTextField(
        hintText: "Model",
        controller: controller.modelController.value,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        readOnly: true,
        focusNode: controller.modelFocusNode.value,
      );
    });
  }

  Widget _registrationNumberFieldView(ShowVehicleController controller) {
    return Obx(() {
      return CustomTextField(
        hintText: "Registration Number",
        controller: controller.registrationNumberController.value,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        readOnly: true,
        focusNode: controller.rgFocusNode.value,
      );
    });
  }
}
