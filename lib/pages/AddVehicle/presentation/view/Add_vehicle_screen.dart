import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/AddVehicle/presentation/controllers/add_vahicle_controller.dart';
import 'package:moto_park/utilities/common_textfield.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:moto_park/Extension/text_field_extenstion.dart';

class AddVehicleScreen extends GetView<AddVehicleController> {
  AddVehicleScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _addVKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: backAppBar(title: "Add Vehicle"),
        body: GetBuilder<AddVehicleController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: _form(),
              ),
              GradientButton(name: "Submit", onTap: () {

                if (_addVKey.currentState?.validate() ?? false) {
                  controller.addVehicleApiCall();
                }
                Get.toNamed(AppRoutes.qrScreen);
              })
                  .marginOnly(bottom: 20, left: 20, right: 20),
            ],
          );
        }));
  }

  _form() {
    return Form(
        key: _addVKey,
        child: Column(
      children: [
        vGap(20),
        _vehicleType(context: Get.context!),


        _brandFieldView(context: Get.context!),

        _modelFieldView(context: Get.context!),

        _registrationNumberFieldView(context: Get.context!),
      ],
    )).paddingSymmetric(horizontal: 15);
  }

  _vehicleType({required BuildContext context}) {
    return Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade100,
            boxShadow: lightShadow
        ),
        child: verticalDot(context));
  }

  verticalDot(context) {
    return DropdownButton(
        elevation: 1,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsets.zero,
        value: controller.dropDownValue,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: controller.vehicleType.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: SizedBox(
                width: Get.width,
                child: Text(items, style: BalooStyles.baloonormalTextStyle())),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.dropDownValue = newValue ?? '';
          // storage.write(USERType, controller.dropDownValue);
          controller.update();
        });
  }

  _brandFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Brand",
        controller: controller.brandController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.modelFocusNode);
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Select Brand");
        },
        focusNode: controller.brandFocusNode);
  }

  _modelFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Model",
        controller: controller.modelController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.rgFocusNode);
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Select Model");
        },
        focusNode: controller.modelFocusNode);
  }

  _registrationNumberFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Registration Number",
        controller: controller.registrationNumberController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context).unfocus();
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Registration Number");
        },
        focusNode: controller.rgFocusNode);
  }
}
