import 'package:get_storage/get_storage.dart';

class VehicleServices{
  final GetStorage storage =GetStorage();

  void saveVehicleId(String vehicleId){
    storage.write("vehicleId", vehicleId);
  }
}

class VehicleService {
  final GetStorage storage = GetStorage();

  String? getVehicleId() {
    return storage.read('vehicleId');
  }
}
