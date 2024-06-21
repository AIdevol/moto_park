import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/registerController.dart';
import 'package:moto_park/pages/home/presentation/controlers/userData_controller.dart';
import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/services/network_exception.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

import '../../../../main.dart';
import '../../../../response_model/register_response_model.dart';
import '../../../../response_model/user_data_modal.dart';
import '../../../../services/login_service.dart';


class EditProfileController extends GetxController {
  late TextEditingController firstNameController;
  late TextEditingController codeController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController emergencyContactController;
  late TextEditingController emergencyContactController2;
  late TextEditingController dobController;
  late TextEditingController passwordController;
  late TextEditingController genderController;
  late TextEditingController confirmPasswordController;
  late TextEditingController bloodGroupController;
  late TextEditingController phoneController;
  late FocusNode firstNameFocusNode;
  late FocusNode codeFocusNode;
  late FocusNode addressFocusNode;
  late FocusNode bloodGroupFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode emergencyContactFocusNode;
  late FocusNode emergencyContactFocusNode2;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late FocusNode genderControllerFocusNode;
  late FocusNode dobFocusNode;
  late FocusNode phoneFocusNode;
  bool isLoading = true;
  String countryCodeVal = '+91';
  String emgContactCodeVal = '+91';
  String emgContactCodeVal2 = '+91';
  List<String> genderType = ["Female", "Male", "Others"];
  String dropDownValue = "Male";
  bool obsecurePassword = true;
  bool obsecureConfirmPassword = true;
  late DateTime selectedDate;
  String? currentAddress;
  Position? currentPosition;
  String altCountryCodeVal = "+91";
  String profileImg = '';
  var currencyIcon;
  late TextEditingController profileImageController;

  UserDetails? userDetails = UserDetails();

  String? idIs;

  String get userImage => userImage;




  // final UserDetails = "";
  @override
  void onClose() {
    firstNameController.dispose();
    codeController.dispose();
    emailController.dispose();
    addressController.dispose();
    emergencyContactController.dispose();
    emergencyContactController2.dispose();
    dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    bloodGroupController.dispose();
    phoneController.dispose();
    firstNameFocusNode.dispose();
    codeFocusNode.dispose();
    addressFocusNode.dispose();
    bloodGroupFocusNode.dispose();
    emailFocusNode.dispose();
    emergencyContactFocusNode.dispose();
    emergencyContactFocusNode2.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    genderControllerFocusNode.dispose();
    dobFocusNode.dispose();
    phoneFocusNode.dispose();
    profileImageController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    firstNameController = TextEditingController();
    codeController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    emergencyContactController = TextEditingController();
    emergencyContactController2 = TextEditingController();
    dobController = TextEditingController();
    passwordController = TextEditingController();
    genderController = TextEditingController();
    confirmPasswordController = TextEditingController();
    bloodGroupController = TextEditingController();
    phoneController = TextEditingController();
    firstNameFocusNode = FocusNode();
    codeFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    bloodGroupFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    emergencyContactFocusNode = FocusNode();
    emergencyContactFocusNode2 = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    genderControllerFocusNode = FocusNode();
    dobFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    hitGetUserProfileAPI();
    // updateUserDetails();
    profileImageController = TextEditingController();

    super.onInit();
  }

  Future<void> getCurrentPosition() async {
    customLoader.show();
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) {
      customLoader.hide();
      return;
    }
    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("currentPosition: $currentPosition");
      await getAddressFromLatLng(currentPosition!);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      customLoader.hide();
      update();
    }
  }

  Future<void> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      currentAddress =
      '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}, ${place.country}';
      print("currentAddress: $currentAddress");
      addressController.text = currentAddress ?? '';
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      customLoader.hide();
      update();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1980),
      lastDate: DateTime(2060),
    );
    if (picked != null) {
      selectedDate = picked;
      dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }
  // ========================================================================Update Userdetails============================================================
  void updateUserProfile() {
    customLoader.show();
    FocusManager.instance.primaryFocus?.unfocus();

    UserDetails updatedUserDetails = UserDetails(
      firstName: firstNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      dateOfBirth: dobController.text,
      address: addressController.text,
      emergencyContact: emergencyContactController.text,
      emergencyContact2: emergencyContactController2.text,
      bloodGroup: bloodGroupController.text,
      gender: genderController.text,
    );

    Get.find<AuthenticationApiService>()
        .updateUserDetailsApiCall(LOCALKEY_token, updatedUserDetails)
        .then((value) async {
      Get.find<GetLoginModalService>().setUserDataModal(userDataModal: updatedUserDetails);
      customLoader.hide();
      toast("User details updated successfully");
      update();
    })
        .catchError((error) {
      if (!Get.isRegistered<EditProfileController>()) {
        return;
      }
      customLoader.hide();
      toast(error.toString());
      String errorMessage = NetworkExceptions.getDioException(error);
      print("Error during update profile API call: $error");
      toast(errorMessage);
    });
  }



  // ==============================================================fetch UserDetails=========================================================
   hitGetUserProfileAPI() {
    FocusManager.instance.primaryFocus!.unfocus();

    Get.find<AuthenticationApiService>()
        .getUserDetailsApiCall(LOCALKEY_token)
        .then((value) async {
      Get.find<GetLoginModalService>().setUserDataModal(userDataModal: value);
      firstNameController.text = value.firstName ?? '';
      codeController.text = value.id?.toString() ?? '';
      emailController.text = value.email ?? '';
      phoneController.text = value.phone ?? '';
      dobController.text = value.dateOfBirth ?? '';
      addressController.text = value.address ?? '';
      emergencyContactController.text = value.emergencyContact ?? '';
      emergencyContactController2.text = value.emergencyContact2 ?? '';
      bloodGroupController.text = value.bloodGroup ?? '';
      genderController.text = value.gender ?? '';
      update();
    }).onError((error, stackTrace) {
      toast(error.toString());
    });
  }

  void hitApiToUpdateProfileLogo() async{
     // customLoader.show();
     // FocusManager.instance.primaryFocus!.unfocus();
     // try{
     //   String fileName = profileImg.split('/').last;
     //   FormData formData = FormData.fromMap({
     //     "user_image": await MultipartFile.fromFile(profileImg, filename: fileName),
     //   });
     //   final authenticationService = Get.find<AuthenticationApiService>();
     //   final response = await authenticationService.addprofileImage(formData);
     //   if (response.statusCode == 200) {
     //     RegisterResponseModel registerResponseModel = RegisterResponseModel.fromJson(response.data);
     //     customLoader.hide();
     //     toast(registerResponseModel.message);
     // }else{
     //     customLoader.hide();
     //     toast("Failed to update profile image");
     //   }
     // } catch (error) {
     //   customLoader.hide();
     //   toast(error.toString());
     // }
    }
     // Get.find<AuthenticationApiService>().addprofileImage(userImage).then((_)async{
     //   await storage.save();
     //
     // });
  }


  // Future<void> hitApiToUpdateProfileLogo(File imageFile) async {
  //   final customLoader = CustomLoader();  // Assuming you have a custom loader implementation
  //   customLoader.show();
  //   FocusManager.instance.primaryFocus?.unfocus();
  //
  //   // Prepare form data with image
  //   String fileName = imageFile.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "user_image": await MultipartFile.fromFile(imageFile.path, filename: fileName),
  //     // Add other fields if required
  //   });
  //
  //   try {
  //     final authenticationService = Get.find<AuthenticationApiService>();
  //     final response = await Dio().post(
  //       "https://yourapiurl.com/update_profile_logo",
  //       data: formData,
  //       options: Options(headers: {
  //         "Authorization": "Bearer YOUR_API_TOKEN",
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Assuming response.data contains the necessary information
  //       registerResponseModel = RegisterResponseModel.fromJson(response.data);
  //       customLoader.hide();
  //       toast(registerResponseModel.message);
  //       // Navigate to the desired routes
  //       Get.offAllNamed(AppRoutes.addVehicle);
  //       Get.offAndToNamed(AppRoutes.homeScreen);
  //     } else {
  //       customLoader.hide();
  //       Get.toNamed(AppRoutes.homeScreen);
  //       toast("Failed to update profile image");
  //     }
  //   } catch (error, stackTrace) {
  //     customLoader.hide();
  //     Get.toNamed(AppRoutes.homeScreen);
  //     toast(error.toString());
  //   }

