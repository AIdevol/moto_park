import 'package:get_storage/get_storage.dart';

import '../main.dart';
import '../utilities/custom_flashbar.dart';
import 'APIs/dio_client.dart';

class VehicleService {
  final GetStorage storage = GetStorage();
  final DioClient dioClient;

  VehicleService(this.dioClient);

  void saveVehicleId(String vehicleId) {
    storage.write('vehicleId', vehicleId);
  }

  String? getVehicleId() {
    return storage.read('vehicleId');
  }
  Future<void> fetchVehicleDetails() async {
    customLoader.show();
    String? vehicleId = getVehicleId();

    if (vehicleId == null) {
      customLoader.hide();
      toast('Vehicle ID not found');
      return;
    }
  }
}
