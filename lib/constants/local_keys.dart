import 'package:moto_park/main.dart';
import 'package:moto_park/response_model/register_response_model.dart';

const String isFirstTime = 'isFirstTime';
const String isSubscribed = 'isSubscribed';
const String isVerifiedQr = 'isVerifiedQr';
const String userId = 'userId';
const String vehicleId = 'vehicleId';

const String LOCALKEY_token = "LOCALKEY_token";
const String RefreshToken = "RefreshToken";
const String LoginModelStKey = "LoginModel";

const String rememberMe = 'rememberMe';
const String emailKey = 'emailKey';
const String passwordKey = 'passwordKey';

RememberMeModal? getRememberMe() {
  String? email = storage.read(emailKey);
  String? password = storage.read(passwordKey);
  if ((email ?? "").isNotEmpty && (password ?? "").isNotEmpty) {
    return RememberMeModal(email: email, password: password);
  }
}

setRememberData({required String email, required String password}) {
  storage.write(emailKey, email);
  storage.write(passwordKey, password);
}



removeRememberData() {
  storage.remove(emailKey);
  storage.remove(passwordKey);
}

class RememberMeModal {
  String? email;
  String? password;
  RememberMeModal({this.email, this.password});
}



// class 