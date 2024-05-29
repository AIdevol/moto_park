import 'package:get/get.dart';
import 'package:moto_park/pages/AddVehicle/binding/addvehicle_binding.dart';
import 'package:moto_park/pages/AddVehicle/binding/showvehicles_binding.dart';
import 'package:moto_park/pages/AddVehicle/presentation/view/Add_vehicle_screen.dart';
import 'package:moto_park/pages/Authentication/binding/binding.dart';
import 'package:moto_park/pages/Authentication/presentation/views/QRcode_information.dart';
import 'package:moto_park/pages/Authentication/presentation/views/change_password_scree.dart';
import 'package:moto_park/pages/Authentication/presentation/views/edit_profile_screen.dart';
import 'package:moto_park/pages/Authentication/presentation/views/forgot_pass_screen.dart';
import 'package:moto_park/pages/Authentication/presentation/views/login_screen.dart';
import 'package:moto_park/pages/Authentication/presentation/views/otp_verfied_screen.dart';
import 'package:moto_park/pages/Authentication/presentation/views/register_screen.dart';
import 'package:moto_park/pages/Authentication/presentation/views/QRcode_screen.dart';
import 'package:moto_park/pages/Authentication/presentation/views/reset_pass_screen.dart';
import 'package:moto_park/pages/Authentication/presentation/views/subscription_screen.dart';
import 'package:moto_park/pages/Notification/binding/notification_biniding.dart';
import 'package:moto_park/pages/Notification/notification.dart';
import 'package:moto_park/pages/home/bindings/home_binding.dart';
import 'package:moto_park/pages/home/presentation/view/home_screen.dart';
import 'package:moto_park/pages/home/sheets/details_Updated.dart';
import 'package:moto_park/pages/splash/binding/binding.dart';
import 'package:moto_park/pages/splash/presentation/views/splash_screen.dart';
import '../pages/Authentication/binding/QRBinding.dart';
import '../pages/Authentication/binding/subscription_bining.dart';
import 'navigation.dart';

class AppPages {
  static const INITIAL = AppRoutes.splash;
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      binding: SplashBinding(),
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      binding: AuthenticationBinding(),
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      binding:HomeBinding(),
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      binding: AuthenticationBinding(),
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.resetpass,
      binding: AuthenticationBinding(),
      page: () => ResetPassScreen(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      binding: AuthenticationBinding(),
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      binding: AuthenticationBinding(),
      page: () => OtpVerfiedScreen(),
    ),
    GetPage(
      name: AppRoutes.forgot,
      binding: AuthenticationBinding(),
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.qrScreen,
      binding: QRBinding(),
      page: () => ScanQrScreen(),
    ),
    GetPage(
      name: AppRoutes.subscriptionScreen,
      binding: SubscriptionBinding(),
      page: () => SubscriptionScreen(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      binding: AuthenticationBinding(),
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.addVehicle,
      binding: AddVehicleBindings(),
      page: () => AddVehicleScreen(),
    ),
    GetPage(
        name: AppRoutes.showVehicle,
        binding: ShowVehicledataBindings(),
        page: () => ShowVehicleScreen()),
    GetPage(
        name: AppRoutes.notification,
        binding: NotificationBindings(),
        page: () => MyNotifications()),
    GetPage(
        name: AppRoutes.QrCodeInform,
        binding:QRBinding(),
        page: () => QrScreenUi()),
    // GetPage(
    //     name: AppRoutes.deleteVehicle,
    //     binding: DeleteVehcileBindings(),
    //     page: () => const VehicleDeletedetails()),
    // GetPage(name: AppRoutes.helpCenter,binding: HelpCenterBindings(), page: HelpCenter())
  ];
}
