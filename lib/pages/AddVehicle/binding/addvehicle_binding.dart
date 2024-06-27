import 'package:get/get.dart';
import 'package:moto_park/pages/AddVehicle/presentation/controllers/add_vahicle_controller.dart';
import 'package:moto_park/pages/home/sheets/sheet_controller/show_vehicle_details_controller.dart';

class AddVehicleBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddVehicleController>(() => AddVehicleController());
  }

}