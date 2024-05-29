import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_park/navigation/navigation.dart';
var path;
class ImgPicker {
    static  galleryImages() async {
      final file = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (file != null) {
        path = File(file.path);
        Get.toNamed(AppRoutes.subscriptionScreen,arguments: {"file":path});

      }
  }
}
