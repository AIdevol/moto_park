import 'package:get/get.dart';
import 'package:moto_park/pages/home/sheets/sheet_controller/details_update_controller.dart';

class ShowVehicledataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowVehicleController>(() => ShowVehicleController());
  }
}
