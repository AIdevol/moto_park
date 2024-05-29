import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/response_model/verify_contact_res_model.dart';
import 'package:moto_park/services/APIs/api_ends.dart';
import '../../../pages/Authentication/presentation/controllers/subscription_screen_controller.dart';
import '../../../response_model/vehical_list_model.dart';
import '../../network_exception.dart';
import '../dio_client.dart';
import 'auth_api_service_impl.dart';

class AuthenticationApiService extends GetxService
    implements AuthenticationApi {
  late DioClient? dioClient;

  var deviceName, deviceType, deviceID;

  getDeviceData() async {
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
      deviceName = androidDeviceInfo.model;
      deviceID = androidDeviceInfo.device;
      deviceType = "1";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await info.iosInfo;
      deviceName = iosDeviceInfo.model;
      deviceID = iosDeviceInfo.identifierForVendor;
      deviceType = "2";
    }
  }

  @override
  void onInit() {
    var dio = Dio();
    dioClient = DioClient(ApiEnd.baseUrl, dio);
    getDeviceData();
  }

  /*================================================= login API Call  ==========================================================*/
  @override
  Future<RegisterResponseModel> loginApiCall(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(ApiEnd.loginEnd, data: dataBody);
      return RegisterResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*================================================= register API Call  ==========================================================*/
  @override
  Future<RegisterResponseModel> registerApiCall(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(ApiEnd.regEnd, data: dataBody);
      return RegisterResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  @override
  Future<RegisterResponseModel> logoutApiCall(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post(
        ApiEnd.logoutEnd,
        data: dataBody,
        options: Options(headers: {
          "Authorization": "Bearer ${await storage.read(LOCALKEY_token)}"
        }),
      );
      return RegisterResponseModel.fromJson(response.data);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*===================================================================== Otp API Call  ==========================================================*/
  @override
  Future<RegisterResponseModel> otpApiCall(
      {phone, Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post("api/verify_contact/phone/${phone}/otp/", data: dataBody);
      return RegisterResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  } /*===================================================================== Otp API Call  ==========================================================*/

  @override
  Future<RegisterResponseModel> otpApiCallEmail(
      { email, Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post("api/forget_password/$email/verify_otp/", data: dataBody);
      return RegisterResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*===================================================================== registr API Call  ==========================================================*/
  @override
  Future<RegisterResponseModel> resendOtpApiCall(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post('getResdOtp', data: dataBody);
      return RegisterResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<VerifyConResModel> verifyPhoneApi(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response =
          await dioClient!.post(ApiEnd.verifyContactEnd, data: dataBody);
      return VerifyConResModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<RegisterResponseModel> changePass(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response =
          await dioClient!.post(ApiEnd.resetPassEnd, data: dataBody, options: Options(
            headers: {'Authorization': 'Bearer ${await storage.read(LOCALKEY_token)}'},
          ),);
      return RegisterResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<RegisterResponseModel> changePassEmail(
      {email, Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post("api/forget_password/$email/set_new_password/", data: dataBody);
      return RegisterResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<VerifyConResModel> forgotPassword(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response =
          await dioClient!.post(ApiEnd.forgotPassEnd, data: dataBody);
      return VerifyConResModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  Future<UserDetails> getUserDetailsApiCall(userid) async {
    try {
      final response = await dioClient!.get(
          "${ApiEnd.userdetailsEnd}/$userid/", skipAuth: false );
      return UserDetails.fromJson(response);
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

// --------------------------------------------------------User details deletion---------------
  Future<void> deleteAccount() async {
    try {
      final response = await dioClient?.delete(ApiEnd.userdetailsEnd);
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to delete account: ${response.statusCode}");
      }
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

// _-------------------------------------------------vehicle deletions-----------------------
  Future<void> deletevehicledetails() async {
    try {
      final response = await dioClient?.delete(ApiEnd.addVehicleEnd);

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to delete account: ${response.statusCode}");
      }
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<Map<String, dynamic>> updateUserDetailsApiCall( userid, reqeuestBody) async {
    try {
      final response = await dioClient!.put(
           "${ApiEnd.userdetailsEnd}/$userid/" ,options: Options(
            headers: {'Authorization': 'Bearer ${await storage.read(LOCALKEY_token)}'}) );
      return response;
    }catch(e) {
      throw NetworkExceptions.getDioException(e);
    }
    }

  Future<VehicleListModel>addVehicledetailsApicall(
      {Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(ApiEnd.addVehicleEnd, data: dataBody);
      return VehicleListModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  Future<VehicleListModel> getVehicledetailsApicall({
    Map<String, dynamic>? dataBody,
  }) async {
    try {
      final response = await dioClient!.post(ApiEnd.addVehicleEnd, data: dataBody);
      return VehicleListModel.fromJson(response.data);
    }catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  // Future<SubscCardModel>getsubscriptionApicall( {Map<String, dynamic>? dataBody})async{
  //   try{
  //     final response = await dioClient!.get(ApiEnd.subscriptionsEnd, data: dataBody);
  //     return response;
  //   }catch(e){
  //     return Future.error(NetworkExceptions.getDioException(e));
  //   }
  // }

  Future<SubscCardModel>addsubscriptionApicall( {Map<String, dynamic>? dataBody})async{
    try{
      final response = await dioClient!.post(ApiEnd.subscriptionsEnd, data: dataBody);
      return response;
    }catch(e){
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
  // Future<SubscCardModel>updatesubscriptionApicall( {Map<String, dynamic>? dataBody})async{
  //   try{
  //     final response = await dioClient!.put(ApiEnd.subscriptionsEnd, data: dataBody);
  //     return response;
  //   }catch(e){
  //     return Future.error(NetworkExceptions.getDioException(e));
  //   }
  // }
  // Future<SubscCardModel>usersubscriptionApicall( {Map<String, dynamic>? dataBody})async{
  //   try{
  //     final response = await dioClient!.post(ApiEnd.subscriptionsEnd, data: dataBody);
  //     return response;
  //   }catch(e){
  //     return Future.error(NetworkExceptions.getDioException(e));
  //   }
  // }
  // Future<SubscCardModel>subscriptionApicall( {Map<String, dynamic>? dataBody})async{
  //   try{
  //     final response = await dioClient!.post(ApiEnd.subscriptionsEnd, data: dataBody);
  //     return response;
  //   }catch(e){
  //     return Future.error(NetworkExceptions.getDioException(e));
  //   }
  // }
  }


