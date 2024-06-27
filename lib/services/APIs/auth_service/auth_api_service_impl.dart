import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/response_model/verify_contact_res_model.dart';

import '../../../response_model/vehical_list_model.dart';

abstract class AuthenticationApi {
  Future<RegisterResponseModel> loginApiCall({Map<String, dynamic>? dataBody});
  Future<LogoutResponseModel> logoutApiCall({Map<String, dynamic>? dataBody});
  Future<RegisterResponseModel> registerApiCall({Map<String, dynamic>? dataBody});
  Future<VerifyConResModel> verifyPhoneApi({Map<String, dynamic>? dataBody});
  Future<RegisterResponseModel> resendOtpApiCall({Map<String, dynamic>? dataBody});
  Future<RegisterResponseModel> otpApiCall({phone,Map<String, dynamic>? dataBody});
  Future<RegisterResponseModel> otpApiCallEmail({email,Map<String, dynamic>? dataBody});
  Future<RegisterResponseModel> changePass({Map<String, dynamic>? dataBody});
  Future<VerifyConResModel> forgotPassword({Map<String, dynamic>? dataBody});
  Future<RegisterResponseModel> changePassEmail({email,Map<String, dynamic>? dataBody});

  Future<VehicleListModel> deleteVehicleDetailsApi({String? vehicleId});
  Future<VehicleListModel> addVehicleDetailsApiCall(
      {Map<String, dynamic>? dataBody});

  Future<VehicleListModel> getVehicleDetailsApiCall(String? vehicleId);
}
