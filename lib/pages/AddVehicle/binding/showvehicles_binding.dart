import 'package:get/get.dart';
import 'package:moto_park/pages/home/sheets/sheet_controller/show_vehicle_details_controller.dart';

class ShowVehicledataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowVehicleController>(() => ShowVehicleController());
  }
}
