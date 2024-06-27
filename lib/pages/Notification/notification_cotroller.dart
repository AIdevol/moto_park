import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NotificationController extends GetxController {
  List<Map<String, dynamic>> notifications = [];

  void addNotification(String title, String message) {
    notifications.add({
      'title': title,
      'message': message,
    });
    update();
  }

  void deleteNotification(int index) {
    notifications.removeAt(index);
    update();
  }

  List<Map<String, dynamic>> fetchNotifications() {
    return notifications;
  }
}
