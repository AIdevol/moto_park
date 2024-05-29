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
  // late UserDetails userDetails;
  UserDetails? userDetails = UserDetails();




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
    super.onClose();
  }

  @override
  void onInit() {
    userDetails = storage.read(LoginModelStKey);
    print( "userDetails?.city??''");
    print( userDetails?.city??'');

    // userDetails = storage.read(userDetails);
    // if(storage.read(LoginModelStKey)!=null) {
    //   userDetails = storage.read(LoginModelStKey);
    // }
    // final userDetailsString = jsonEncode(userDetails?.toJson());
    // storage.write(LoginModelStKey, userDetailsString);
    // final userDetailsString = storage.read(LoginModelStKey);
    // if (userDetailsString != null) {
    //   userDetails = UserDetails.fromJson(jsonDecode(userDetailsString));
    // }

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      hitGetUserProfileAPI();
      updateUserDetails();
    });
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
  void updateUserDetails() {
    customLoader.show();
    FocusManager.instance.primaryFocus?.unfocus();

  var requestBody = {
     'first_name': firstNameController.text,
     'email': emailController.text,
     'phone': phoneController.text,
     'date_of_birth': dobController.text,
     'address': addressController.text,
     'emergency_contact1': emergencyContactController.text,
     'emergency_contact2': emergencyContactController2.text,
     'blood_group': bloodGroupController.text,
     'gender': genderController.text,
   };

    Get.find<AuthenticationApiService>()
        .updateUserDetailsApiCall(userDetails?.id??'', requestBody)
        .then((value) async {
      customLoader.hide();

      toast("User details updated successfully");
      update();
    }).catchError((error) {
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

    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    Get.find<AuthenticationApiService>()
        .getUserDetailsApiCall(userDetails?.id??'')
        .then((value) async {
      customLoader.hide();
      UserDetails userDetails = UserDetails.fromJson(value);
      firstNameController.text = userDetails.firstName ?? '';
      codeController.text = userDetails.id?.toString() ?? '';
      emailController.text = userDetails.email ?? '';
      phoneController.text = userDetails.phone ?? '';
      dobController.text = userDetails.dateOfBirth ?? '';
      addressController.text = userDetails.address ?? '';
      emergencyContactController.text = userDetails.emergencyContact ?? '';
      emergencyContactController2.text = userDetails.emergencyContact2 ?? '';
      bloodGroupController.text = userDetails.bloodGroup ?? '';
      genderController.text = userDetails.gender ?? '';
      passwordController.text = ''; // Do not fetch password for security reasons
      confirmPasswordController.text = ''; // Do not fetch confirm password
      toast("User profile fetched successfully");
      update();
    }).onError((error, stackTrace) {
      if (!Get.isRegistered<EditProfileController>()) {
        return;
      }
      customLoader.hide();
      toast(error.toString());
      String errorMessage = NetworkExceptions.getDioException(error);
      print("Error during user profile API call: $error");
      print("StackTrace: $stackTrace");
      toast(errorMessage);
    });
  }
  Future<void> hitApiToUpdateProfileLogo() async {
// Implement your logic to update the profile logo
  }
}
