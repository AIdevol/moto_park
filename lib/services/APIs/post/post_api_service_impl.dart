import 'package:dio/dio.dart' as httpdio;
import 'package:get/get.dart';
import 'package:moto_park/services/APIs/post/post_api_service.dart';
import '../api_ends.dart';
import '../dio_client.dart';

class PostApiServiceImpl extends GetxService implements PostApiService {
  late DioClient? dioClient;

  @override
  void onInit() {
    var dio = httpdio.Dio();
    dioClient = DioClient(ApiEnd.baseUrl, dio);
  }

  postVehicleApiCall({required Map<String, String> dataBody}) {}

  // @override
  // Future<List<VehicleListModel>> postVehicleApiCall(
  //     {Map<String, dynamic>? dataBody}) async {
  //   try {
  //     final response =
  //         await dioClient!.post(ApiEnd.addVehicleEnd, data: dataBody);
  //     List data = response;
  //     return VehicleListModel.fromJson(response);
  //   } catch (e) {
  //     return  Future.error(NetworkExceptions.getDioException(e));
  //   }
  // }
}
