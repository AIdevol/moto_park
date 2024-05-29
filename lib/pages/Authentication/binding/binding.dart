import 'package:get/get.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/change_password_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/edit_profile_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/forgot_pass_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/qr_Information_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/qr_code_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/reset_pass_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/subscription_screen_controller.dart';
import 'package:moto_park/pages/Notification/notification_cotroller.dart';
import 'package:moto_park/pages/home/presentation/controlers/home_controller.dart';
import 'package:moto_park/pages/home/sheets/sheet_controller/details_update_controller.dart';
import 'package:moto_park/pages/payment/presentation/controlller/payment_controller.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../presentation/controllers/loginController.dart';
import '../presentation/controllers/registerController.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<ResetPassController>(() => ResetPassController());
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    Get.lazyPut<OtpFieldController>(() => OtpFieldController());
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
    Get.lazyPut<ForgotPassController>(() => ForgotPassController());
    // Get.lazyPut<ShowVehicleController>(() => ShowVehicleController());
  }
}




