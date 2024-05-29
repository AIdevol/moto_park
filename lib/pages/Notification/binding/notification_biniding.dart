import 'package:get/get.dart';
import 'package:moto_park/pages/Notification/notification_cotroller.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
