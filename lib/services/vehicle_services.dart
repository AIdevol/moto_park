import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moto_park/response_model/vehical_list_model.dart';

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

// class VehicleServices extends GetxService{
//   VehicleListModel? _vehicleListModel;
//
//   @override
//   void onInit{
//     super.onInit();
// }
//   VehicleListModel? getVehicleDataModel(){
//     return _vehicleListModel;
// }
//
// void setVehicleListModel( VehicleListModel? vehicleDataModel){
//      _vehicleListModel = vehicleDataModel;
// }
//
// void clearVehicleData() {
//   _vehicleListModel = null;
//   // log.i('Vehicle data cleared');
// }
// }