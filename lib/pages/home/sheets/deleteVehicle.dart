// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/pages/AddVehicle/presentation/controllers/add_vahicle_controller.dart';
// import 'package:moto_park/pages/home/sheets/sheet_controller/vehicle_delete_controller.dart';
// import 'package:moto_park/utilities/common_textfield.dart';
// import 'package:moto_park/utilities/gradient_button.dart';
// import 'package:moto_park/utilities/helper_widget.dart';

// class VehicleDetailsScreen extends GetView<AddVehicleController> {
//   final _vehicleDetailsKey = GlobalKey<FormState>();

//   VehicleDetailsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text(
//           'Vehicle Details',
//           style: TextStyle(
//               fontFamily: 'Gilroy',
//               fontWeight: FontWeight.w700,
//               fontSize: 17,
//               color: Colors.black),
//         ),
//       ),
//       body: GetBuilder<AddVehicleController>(
//         builder: (controller) {
//           var registrationNumberController;
//           return Form(
//             key: _vehicleDetailsKey,
//             child: ListView(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               children: [
//                 vGap(10),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.shade100),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Vehicle Type',
//                         style: TextStyle(
//                             fontFamily: 'Gilroy',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14,
//                             color: Colors.black),
//                       ),
//                       vGap(10),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: DropdownButton<String>(
//                                 value: controller.selectedVehicleType,
//                                 items: controller.vehicleTypes
//                                     .map((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   controller.selectedVehicleType = value!;
//                                   controller.update();
//                                 },
//                               ),
//                             ),
//                             vGap(10),
//                             Icon(
//                               Icons.keyboard_arrow_down_outlined,
//                             ),
//                           ],
//                         ),
//                       ),
//                       vGap(10),
//                       Text(
//                         'Brand',
//                         style: TextStyle(
//                             fontFamily: 'Gilroy',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14,
//                             color: Colors.black),
//                       ),
//                       vGap(10),
//                       CommonTextField(
//                         textInputType: TextInputType.name,
//                         textInputAction: TextInputAction.next,
//                         onFieldSubmitted: (value) {
//                           controller.nextFocus();
//                         },
//                         controller: controller.brandController,
//                         validator: (value) {
//                           return value!.isEmpty
//                               ? 'Please enter a brand'
//                               : null;
//                         },
//                       ),
//                       vGap(10),
//                       Text(
//                         'Model',
//                         style: TextStyle(
//                             fontFamily: 'Gilroy',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14,
//                             color: Colors.black),
//                       ),
//                       vGap(10),
//                       CommonTextField(
//                         textInputType: TextInputType.name,
//                         textInputAction: TextInputAction.next,
//                         onFieldSubmitted: (value) {
//                           controller.nextFocus();
//                         },
//                         controller: controller.modelController,
//                         validator: (value) {
//                           return value!.isEmpty
//                               ? 'Please enter a model'
//                               : null;
//                         },
//                       ),
//                       vGap(10),
//                       Text(
//                         'Registration Number',
//                         style: TextStyle(
//                             fontFamily: 'Gilroy',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14,
//                             color: Colors.black),
//                       ),
//                       vGap(10),
//                       CommonTextField(
//                         textInputType: TextInputType.number,
//                         textInputAction: TextInputAction.done,
//                         onFieldSubmitted: (value) {
//                           controller.done();
//                         },
//                         controller:
//                             controller?.registrationNumberController,
//                         validator: (value) {
//                           return value!.isEmpty
//                               ? 'Please enter a registration number'
//                               : null;
//                         },
//                       ),
//                       vGap(10),
//                       GradientButton(
//                         name: 'Update Vehicle',
//                         onTap: () {
//                           if (_vehicleDetailsKey.currentState!.validate()) {
//                             controller?.updateVehicleDetails();
//                           }
//                         },
//                       ),
//                       vGap(10),
//                       GradientButton(
//                         name: 'Delete Vehicle',
//                         onTap: () {
//                           final vehicleId =
//                               controller?.vehicleDetails.vehicleId;
//                           Get.find<VehicleDeleteController>()
//                               .showConfirmationDialog(vehicleId);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/pages/home/sheets/sheet_controller/vehicle_delete_controller.dart';
//
// class VehicleDeletedetails extends GetView {
//   const VehicleDeletedetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final VehicleDeleteController controller = Get.find();
//     const int vehicleId = 1;
//     // final int vehicleId = Get.arguments;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Delete Vehicle'),
//       ),
//       body: _onDelete(context, controller, vehicleId),
//     );
//   }
//
//   Widget _onDelete(
//       BuildContext context, VehicleDeleteController controller, int vehicleId) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Are you sure you want to delete vehicle with ID: $vehicleId?',
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               controller.deleteVehicle(vehicleId);
//             },
//             child: Text('Delete'),
//           ),
//         ],
//       ),
//     );
//   }
// }
