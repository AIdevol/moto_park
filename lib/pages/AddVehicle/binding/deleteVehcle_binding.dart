import 'package:get/get.dart';
import 'package:moto_park/pages/home/sheets/sheet_controller/vehicle_delete_controller.dart';

class DeleteVehcileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleDeleteController>(() => VehicleDeleteController());
  }
}
