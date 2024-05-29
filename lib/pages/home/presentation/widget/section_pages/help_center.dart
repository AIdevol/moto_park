import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/pages/home/presentation/widget/section_pages/bindings/help_controller.dart';

import 'package:moto_park/pages/home/presentation/widget/section_pages/bindings/helpcenterWidgets.dart';
import 'package:moto_park/utilities/google_font_text_style.dart'; // Update this import as needed

class HelpCenter extends StatelessWidget {
  final HelpCenterController controller = Get.put(HelpCenterController());

  HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(
          'Help Center',
          style: BalooStyles.balooboldTextStyle(color: blackColor, size: 15),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.helpCenterList.length,
            itemBuilder: (context, index) {
              return HelpTopicWidget(topic: controller.helpCenterList[index]);
            },
          );
        }
      }),
    );
  }
}
