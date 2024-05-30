import 'package:get/get.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/subscription_screen_controller.dart';

import '../../payment/presentation/controlller/payment_controller.dart';


class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionScreenController>(() => SubscriptionScreenController());
    Get.lazyPut<PaymentController>(()=>PaymentController());
    // Get.lazyPut<ShowVehicleController>(() => ShowVehicleController());
  }
}