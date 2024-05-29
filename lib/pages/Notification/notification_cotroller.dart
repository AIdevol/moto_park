import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NotificationController extends GetxController {
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: '',
//       connectTimeout: const Duration(milliseconds: 3000),
//       receiveTimeout: const Duration(milliseconds: 3000),
//     ),
//   )..interceptors.add(Logging());

//   Future<List<dynamic>> fetchNotifications() async {
//     try {
//       final response = await _dio.get('/notifications');
//       return response.data;
//     } on DioError catch (e) {
//       print('Error fetching notifications: $e');
//       throw e;
//     }
//   }
// }

// class Logging extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('REQUEST[${options.method}] => PATH: ${options.path}');
//     return super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     print(
//       'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
//     );
//     return super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     print(
//       'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
//     );
//     return super.onError(err, handler);
//   }

  // Mocked response data

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
