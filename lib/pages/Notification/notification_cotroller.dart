import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NotificationController extends GetxController {

  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Your Premium has expired...',
      'message':
          'I am notifying you that your premium has expired kinldy renewed your premium. \nThank you..'
    },
    {
      'title': 'Your Premium will be expired with in 2 days..',
      'message':
          'Hello user, we are informing you that your premium will be expiring with in 2 days kindly up to date your subscription.\nThank you.'
    },
    {
      'title': '"Congratulations" you have Created your Profile successfully.',
      'message':
          '"Congratulations", You have Created your Profile successfully., kindly update you subscription for a good experience.',
    },
  ];

  void deleteNotification(int index) {
    notifications.removeAt(index);
    update();
  }

  List<Map<String, dynamic>> fetchNotifications() {
    return notifications;
  }
}
