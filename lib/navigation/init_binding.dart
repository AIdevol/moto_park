import 'package:get/get.dart';
import 'package:moto_park/pages/Authentication/binding/binding.dart';
import 'package:moto_park/pages/home/bindings/home_binding.dart';
import 'package:moto_park/pages/payment/binding/bindings.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import '../../../../services/APIs/post/post_api_service_impl.dart';


class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationBinding>(AuthenticationBinding());
    Get.put<PaymentBinding>(PaymentBinding());
    Get.put<HomeBinding>(HomeBinding());


    Get.lazyPut<PostApiServiceImpl>(
          () => PostApiServiceImpl(),
    ); Get.lazyPut<AuthenticationApiService>(
          () => AuthenticationApiService(),
    );
  }
}
