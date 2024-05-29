import 'package:get/get.dart';
import 'package:moto_park/pages/payment/presentation/controlller/payment_controller.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }

}