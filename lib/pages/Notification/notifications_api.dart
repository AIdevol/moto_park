// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest_all.dart' as timezone;
// import 'package:timezone/timezone.dart' as timezone;
//
// class NotificationApi{
//   static final _notification = FlutterLocalNotificationsPlugin();
//
//   static void init() {
//     _notification.initialize(
//       const InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//         iOS: DarwinInitializationSettings(),
//       ),
//     );
//   }
//   static scheduleNotification() async {
//     timezone.initializeTimeZones();
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'channel id',
//       'channel name',
//       channelDescription: 'channel description',
//       importance: Importance.max, // set the importance of the notification
//       priority: Priority.high, // set prority
//     );
//     var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//     await _notification.zonedSchedule(
//         "id" as int,
//         "notification title",
//         'Message goes here',
//         timezone.TZDateTime.now(timezone.local).add(const Duration(seconds: 10)),
//         platformChannelSpecifics,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//         androidAllowWhileIdle: true);
//   }
//
// }
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    // Request permission
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      announcement: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Get FCM token
    final token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');

    // Initialize local notifications
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Create high importance notification channel for Android
    await _createNotificationChannel();

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
  }

  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static void _handleForegroundMessage(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            icon: android.smallIcon,
          ),
        ),
      );
    }
  }
}