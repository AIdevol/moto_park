import 'package:get/get.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/qr_Information_controller.dart';

import '../presentation/controllers/qr_code_controller.dart';

class QRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScreenController>(() => QrScreenController());
    Get.lazyPut<QrCodeController>(() => QrCodeController());
    // Get.lazyPut<ShowVehicleController>(() => ShowVehicleController());
  }
}