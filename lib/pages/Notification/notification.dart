import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/pages/Notification/notification_cotroller.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class MyNotifications extends GetView<NotificationController> {
  const MyNotifications({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: BalooStyles.balooboldTextStyle(color: Colors.black, size: 16),
        ),
        backgroundColor: appColor,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: appColor,
        child: GetBuilder<NotificationController>(
          init: NotificationController(),
          builder: (notificationController) {
            final notifications = notificationController.fetchNotifications();
            if (notifications.isEmpty) {
              return Center(
                child: Text(
                  'No notifications available.',
                  style: BalooStyles.baloomediumTextStyle(
                      color: blackColor, size: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Dismissible(
                  key: Key(notification['title']),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    margin: EdgeInsets.all(16.0),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  onDismissed: (direction) {
                    notificationController.deleteNotification(index);
                    final title = notification['title'];
                    final message = notification['message'];
                    Get.snackbar(
                        'Notification Deleted..', 'You dismissed: $title',
                        backgroundColor: Color(0xFFFFE0).withOpacity(0.9),
                        colorText: Colors.black,
                        duration: const Duration(milliseconds: 3000),
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.only(
                            bottom: 20.0, right: 10, left: 10));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: NotificationCard(
                      title: notification['title'],
                      message: notification['message'],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;

  const NotificationCard({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 249, 252, 215),
      // color: blueShade2,
      margin: const EdgeInsets.all(8.0),
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            vGap(8.0),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
