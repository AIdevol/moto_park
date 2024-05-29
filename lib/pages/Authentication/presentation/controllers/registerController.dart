import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/response_model/verify_contact_res_model.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';
import 'package:geocoding/geocoding.dart';

class RegisterController extends GetxController {
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
  late FocusNode firsrNameFocusNode;
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
  String countryCodeVal = '+91';
  String emgContactCodeVal = '+91';
  String emgContactCodeVal2 = '+91';
  List<String> genderType = [
    "Female",
    "Male",
    "Others",
  ];
  String dropDownValue = "Male";
  bool obsecurePassword = true;
  bool obsecureConfirmPassword = true;
  late DateTime selectedDate;
  String? currentAddress;
  Position? currentPosition;

  RegisterResponseModel registerResponseModel = RegisterResponseModel();

  VerifyConResModel verifyConResModel = VerifyConResModel();

  @override
  void onInit() {
    firstNameController = TextEditingController();
    codeController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();
    bloodGroupController = TextEditingController();

    confirmPasswordController = TextEditingController();
    emergencyContactController = TextEditingController();
    emergencyContactController2 = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();

    firsrNameFocusNode = FocusNode();
    dobFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    codeFocusNode = FocusNode();
    emergencyContactFocusNode = FocusNode();
    emergencyContactFocusNode2 = FocusNode();
    emailFocusNode = FocusNode();
    bloodGroupFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    super.onInit();
  }

  Future selectDate(BuildContext context) async {
    print("dfbsdhfshdf");

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1980),
        lastDate: DateTime(2060));
    if (picked != null) {
      selectedDate = picked;
      var outputFormat = DateFormat('yyyy-MM-dd');
      dobController.text = outputFormat.format(selectedDate);
    }
  }

  @override
  void onClose() {
    customLoader.hide();
    emailController.dispose();

    passwordController.dispose();
    emailFocusNode.dispose();

    passwordFocusNode.dispose();

    super.onClose();
  }

  @override
  void onReady() {}

  /*===================================================================== Password Visibility  ==========================================================*/
  showOrHidePasswordVisibility() {
    obsecurePassword = !obsecurePassword;
    update();
  }

  showOrHideConfirmPasswordVisibility() {
    obsecureConfirmPassword = !obsecureConfirmPassword;
    update();
  }

  bool isLoadingLocation = false;

  //APIs

  /*===================================================================== Register API Call  ==========================================================*/
  hitRegisterAPI() {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();

    var loginReq = {
      "email": emailController.text.trim(),
      "full_name": firstNameController.text,
      "phone": countryCodeVal + phoneController.text.trim(),
      "gender": "M",
      "address": addressController.text,
      "blood_group": bloodGroupController.text,
      "date_of_birth": dobController.text,
      "emergency_contact1":
          emgContactCodeVal + emergencyContactController.text.trim(),
      "emergency_contact2":
          emgContactCodeVal + emergencyContactController2.text.trim(),
      "password": passwordController.text
    };
    Get.find<AuthenticationApiService>()
        .registerApiCall(dataBody: loginReq)
        .then((value) async {
      registerResponseModel = value;
      customLoader.hide();
      toast(registerResponseModel.message);
      storage.write(LOCALKEY_token, value.accessToken);
      storage.write(RefreshToken, value.accessToken);
      storage.write(LoginModelStKey, value.userDetails);
      storage.write(isFirstTime, false);
      Get.offAllNamed(AppRoutes.addVehicle);
      Get.offAndToNamed(AppRoutes.homeScreen);
    }).onError((error, stackTrace) {
      customLoader.hide();
      Get.toNamed(AppRoutes.homeScreen);
      toast(error.toString());
    });
  }

  void getVerifyContactApi(phone, type) {
    customLoader.show();
    FocusManager.instance.primaryFocus!.unfocus();
    var loginReq = {"contact_type": 'phone', "contact_value": phone};
    Get.find<AuthenticationApiService>()
        .verifyPhoneApi(dataBody: loginReq)
        .then((value) async {
      verifyConResModel = value;
      customLoader.hide();
      toast(verifyConResModel.rOtp, seconds: 15);
      Get.toNamed(AppRoutes.otpScreen, arguments: {
        "OTP": verifyConResModel.rOtp,
        "PHONE": phone,
        "Type": type,
        "email": false
      });
      Get.offAndToNamed(AppRoutes.homeScreen);
    }).onError((error, stackTrace) {
      customLoader.hide();
      print("hceck___________---________________");
      toast(error.toString());
    });
  }

  Future<void> getCurrentPosition() async {
    customLoader.show();
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) {
      return;
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      print("current");
      print("${currentPosition}");
      customLoader.hide();
      update();
    }).catchError((e) {
      customLoader.hide();

      debugPrint(e);
    }).whenComplete(() => getAddressFromLatLng(currentPosition!));
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress =
          '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode},${place.country},';
      print("currentAddress");
      print("${currentAddress}");
      addressController.text = currentAddress ?? '';
      customLoader.hide();
      update();
    }).catchError((e) {
      customLoader.hide();

      debugPrint(e);
    });
  }
}

Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    toast('Location services are disabled. Please enable the services');
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      toast('Location permissions are denied');
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    toast(
        'Location permissions are permanently denied, we cannot request permissions.');
    return false;
  }
  return true;
}
