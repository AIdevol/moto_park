import 'package:get/get.dart';
import 'package:moto_park/pages/home/presentation/controlers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }


}