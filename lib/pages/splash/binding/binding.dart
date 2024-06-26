import 'package:get/get.dart';
import '../presentation/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );

    // Get.put(() => GetLoginModalService(),permanent: true);
  }
}
