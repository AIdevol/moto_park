import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'error_toast.dart';

toast(
  message, {
  int seconds = 2,
  String? title,
}) =>
    EdgeAlert.show(Get.context!,
        description: message ?? "",
        duration: seconds,
        gravity: EdgeAlert.BOTTOM,
        backgroundColor: Colors.white);

errorDialog(message) {
  EdgeAlert.show(Get.context!,
      description: message,
      gravity: EdgeAlert.BOTTOM,
      backgroundColor: Colors.white);
}
