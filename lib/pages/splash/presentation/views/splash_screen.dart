import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/const_string.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<SplashController>(
      builder: (controller) {
        return Container(
            alignment: Alignment.center,
          height: Get.height,width: Get.width,
            color: appColor,
            child:  Image.asset(appIcon,height: Get.height,width: Get.width,fit: BoxFit.contain,),
        );
      },
    ));
  }
}
