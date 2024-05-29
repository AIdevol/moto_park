import 'package:get/get.dart';
import 'package:moto_park/pages/home/presentation/widget/section_pages/bindings/help_controller.dart';

class HelpCenterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpCenterController>(() => HelpCenterController());
  }
}
