// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/constants/local_keys.dart';
// import 'package:moto_park/main.dart';
// import 'package:moto_park/utilities/custom_dialogue.dart';

// class HomeController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   late AnimationController animationController;

//   var orderId;
//   var paymentId;
//   var signature;
//   Map<String, dynamic> userDetails = {};
//   List<String> titleList = [
//     'View Documents and Reminders',
//     'Link QR Decal',
//     'Location History',
//     'POIs & Fences',
//     'Update Vehicle Details',
//     'Delete Vehicle',
//   ];

//   @override
//   void onInit() {
//     // if(storage.read(LoginModelStKey)!=null) {
//     //   userDetails = storage.read(LoginModelStKey);
//     // }
//     print(storage.read(LoginModelStKey));

//     // orderId = Get.arguments["orderid"];
//     // paymentId = Get.arguments["paymentId"];
//     // signature = Get.arguments["signature"];
//     super.onInit();
//     animateBottom();
//     getLoginDetails();
//   }

//   // RxBool isExpanded = false.obs
//   animateBottom() {
//     animationController = AnimationController(
//       duration: const Duration(milliseconds: 3000),
//       vsync: this,
//     );

//     animationController.forward();
//   }
//   //  void toggleExpansion() {
//   //   isExpanded.value = !isExpanded.value;
//   // }
//   getLoginDetails() {
//     // userDetails = storage.read(LoginModelStKey);
//     print('data');
//     // print(data);
//     // userDetails?.phone = data['phone'];
//     // userDetails?.email = data['email'];
//     // userDetails?.firstName = data['first_name'];
//     // userDetails?.lastName = data['last_name'];
//     // userDetails?.gender= data['gender'];
//     // userDetails?.bloodGroup = data['blood_group'];
//     // userDetails?.emergencyContact1 = data['emergency_contact1'];
//     // userDetails?.dateOfBirth = data['date_of_birth'];
//     // userDetails?.emergencyContact2 = data['emergency_contact2'];
//     update();
//   }

//   @override
//   void onReady() {
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) {
//         return CustomDialogue(
//           onOkTap: () {
//             Get.back();
//           },
//           title: 'Activated Successfully',
//           desc: 'Your ANC Account is Activated',
//         );
//       },
//     );
//     super.onReady();
//   }
// }
// ----------------------------------------------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/constants/local_keys.dart';
// import 'package:moto_park/main.dart';
// import 'package:moto_park/navigation/navigation.dart';
// import 'package:moto_park/pages/Authentication/presentation/views/QRcode_information.dart';
// import 'package:moto_park/utilities/custom_dialogue.dart';

// class HomeController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   late AnimationController animationController;

//   var orderId;
//   var paymentId;
//   var signature;
//   Map<String, dynamic> userDetails = {};
//   List<String> titleList = [
//     'View Documents and Reminders',
//     'Link QR Decal',
//     'Location History',
//     'POIs & Fences',
//     'Update Vehicle Details',
//     'Delete Vehicle',
//   ];

//   // New variables for expansion control
//   RxBool isExpanded = false.obs;

//   @override
//   void onInit() {
//     print(storage.read(LoginModelStKey));
//     super.onInit();
//     animateBottom();
//     getLoginDetails();
//   }

//   animateBottom() {
//     animationController = AnimationController(
//       duration: const Duration(milliseconds: 3000),
//       vsync: this,
//     );

//     animationController.forward();
//   }

//   getLoginDetails() {
//     print('data');
//     // userDetails = storage.read(LoginModelStKey);
//     update();
//   }

//   // Method to toggle expansion
//   void toggleExpansion() {
//     isExpanded.value = !isExpanded.value;
//   }

//   void onViewDocumentsAndRemindersPressed() {
//     Get.toNamed(AppRoutes.documentAndReminders);
//   }

//   void onLinkQRDecalPressed() {
//     Get.to(QRScannerWidget());
//   }

//   void onLinkLocationHistory() {}

//   void onlinkPoifence() {}

//   void onLinkUpdateVehicle() {}

//   void onLinkDeleteVehicle() {}

//   @override
//   void onReady() {
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) {
//         return CustomDialogue(
//           onOkTap: () {
//             Get.back();
//           },
//           title: 'Activated Successfully',
//           desc: 'Your ANC Account is Activated',
//         );
//       },
//     );
//     super.onReady();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your App Title'),
//       ),
//       body: ListView.builder(
//         itemCount: titleList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 switch (index) {
//                   case 0:
//                     onViewDocumentsAndRemindersPressed();
//                     break;
//                   case 1:
//                     onLinkQRDecalPressed();
//                     break;
//                   case 2:
//                     onLinkLocationHistory();
//                     break;
//                   case 3:
//                     onlinkPoifence();
//                     break;
//                   case 4:
//                     onLinkDeleteVehicle();
//                     break;
//                   case 5:
//                     onLinkUpdateVehicle();
//                     break;
//                   default:
//                     break;
//                 }
//               },
//               child:
//                   Container(color: Colors.amber, child: Text(titleList[index])),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/navigation/navigation.dart';
// import 'package:moto_park/pages/home/presentation/view/home_screen.dart';
// import 'package:moto_park/pages/home/sheets/deleteVehicle.dart';
import 'package:moto_park/pages/home/sheets/map_location.dart';
import 'package:moto_park/pages/home/sheets/savedDocs.dart';
import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/response_model/vehical_list_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/utilities/custom_dialogue.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  Map<String, dynamic> userDetails = {};
  List<String> titleList = [
    'View Documents and Reminders',
    'Location History',
    'Show Vehicle Details',
    'Delete Vehicle',
  ];



  // VehicleListModel vehicleListModel = VehicleListModel;

  @override
  void onInit() {
    initAnimation();
    fetchLoginDetails();
    super.onInit();
  }

  //
  void initAnimation() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1),
      vsync: this,
    )..addListener(() {
        update();
      });

    animationController.forward();
  }

  void fetchLoginDetails() {
    // print(storage.read(LoginModelStKey));

    // update();
  }

  @override
  void onReady() {
    super.onReady();
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CustomDialogue(
          onOkTap: () {
            Get.back();
          },
          title: 'Activated Successfully',
          desc: 'Your ANC Account is Activated',
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onTitleTapped(String title, String id) {
    print('Title tapped: $title');
    switch (title) {
      case 'View Documents and Reminders':
        Get.to(() => const DocumentAndReminder());
        break;
      case 'Location History':
        Get.to(() => const MapLocation(
              locationHistory: [],
            ));
        break;
      case 'Show Vehicle Details':
        Get.toNamed(AppRoutes.showVehicle);
        break;
      case 'Delete Vehicle':
        Get.defaultDialog(
          backgroundColor: Colors.yellow,
          title: "Delete Account",
          titleStyle:
              BalooStyles.balooboldTextStyle(color: Colors.black87, size: 15),
          content: Text(
            "Are you sure you want to delete account?",
            style: BalooStyles.baloomediumTextStyle(
                color: Colors.black87, size: 15),
          ),
          textConfirm: "Yes",
          textCancel: "No",
          onConfirm: () async {
            await hitDeleteVehicleApi(vehicleId);
            Get.back();
          },
          onCancel: () {
            Get.back();
          },
        );
        break;
      default:
        break;
    }
  }

  void hitApiToLogout() {
    customLoader.show();
    Get.find<AuthenticationApiService>().logoutApiCall().then((value) async {
      print("hellow++++++++++++++++++++");
      customLoader.hide();
      await storage.remove(LOCALKEY_token);
      await storage.remove(userId);
      await storage.remove(RefreshToken);
      await storage.remove(isFirstTime);
      log.d("Logged out successfully");
      Get.offAllNamed(AppRoutes.login);
      update();
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error.toString());
    });
  }

  void hitDeleteAccountApi() {
    customLoader.show();
    Get.find<AuthenticationApiService>()
        .deleteAccountApiCall(LOCALKEY_token)
        .then((value) {
      print("--------------assigning delete accorunging");
      customLoader.hide();
      storage.remove(LOCALKEY_token);
      storage.remove(userId);
      storage.remove(RefreshToken);
      storage.remove(isFirstTime);
      print("Delete accounting successfully");
      toast("Successfully!, Deleted Api");
      Get.back();
      if (storage.read(isVerifiedQr) == false) {
        Get.toNamed(AppRoutes.qrScreen);
      } else {
        Get.toNamed(AppRoutes.login);
      }
      Get.offAllNamed(AppRoutes.homeScreen);
      update();
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error.toString());
    });
  }

  // we dont know whre is vehcile id , so 1st you need to implements vehicle details api than you get the id from where got it pass it in the api ok

   hitDeleteVehicleApi(String vehicle_id) {
    customLoader.show();
    Get.find<AuthenticationApiService>()
        .deleteVehicleDetailsApi(vehicleId: '9')
        .then((isDelete) {
      customLoader.hide();
      if (isDelete==true) {
        storage.remove(vehicle_id);
        print("Delete vehicles successfully");
        if (storage.read(isVerifiedQr) == false) {
          Get.toNamed(AppRoutes.addVehicle);
        } else {
          Get.toNamed(AppRoutes.homeScreen);
        }
      } else {
        print("Deletion failed but no exception thrown");
      }
      update();
    }).onError((error, stackTrace) {
      customLoader.hide();
      toast(error.toString());
    });
  }
}
