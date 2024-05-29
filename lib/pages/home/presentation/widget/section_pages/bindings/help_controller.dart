import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/pages/home/presentation/widget/section_pages/copyright.dart';
import 'package:moto_park/pages/home/presentation/widget/section_pages/disclaimer.dart';
import 'package:moto_park/pages/home/presentation/widget/section_pages/termsAndConditions.dart';

import '../privacy_policy.dart';

class HelpCenterController extends GetxController {
  var isLoading = true.obs;
  var helpCenterList = <HelpTopic>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHelpTopics();
  }

  void loadHelpTopics() {
    // Simulating fetching data with a delay
    Future.delayed(Duration(seconds: 2), () {
      var fetchedTopics = [
        HelpTopic(
          title: 'Terms and Conditions',
          action: () => Get.to(TermsAndConditions()),
        ),
        HelpTopic(
          title: 'Privacy Policy',
          action: () => Get.to(PrivacyPolicy()),
        ),
        HelpTopic(
          title: 'Copyright',
          action: () => Get.to(CopyRights()),
        ),
        HelpTopic(
          title: 'Disclaimer',
          action: () => Get.to(Disclaimer()),
        ),
      ];
      helpCenterList.assignAll(fetchedTopics);
      isLoading(false);
    });
  }
}

class HelpTopic {
  String title;
  void Function() action;

  HelpTopic({required this.title, required this.action});
}
