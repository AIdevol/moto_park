
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/qr_Information_controller.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/image_picker.dart';

class QrScreenUi extends GetView<QrScreenController> {
  QrScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                QRView(
                  key: controller.qrKey,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 12,
                    overlayColor: Colors.black.withOpacity(.4),
                    borderColor: darkBlue,
                  ),
                  onQRViewCreated: controller.onQRViewCreated,
                  onPermissionSet:
                      (QRViewController controller, bool result) {
                   // controller.
                      },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              color: darkBlue,
              alignment: Alignment.center,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // controller.toggleFlashlight();
                      controller.qrViewController?.toggleFlash();
                      controller.isLightOn = !controller.isLightOn;
                      controller.update();

                      // if (controller.qrViewController != null){
                      //   controller.qrViewController!.toggleFlash().then((isFlashOn){
                      //     controller .isLightOn = isFlashOn;
                      //     controller.update();

                      //   });

                      // }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            var imagePath = await ImgPicker.galleryImages();
                            if (imagePath != null) {
                              controller.galleyPath = imagePath;
                              String? result = await Scan.parse(
                                  controller.galleyPath?.path ?? '');
                              print("result");
                              print(result);
                              controller.update();
                            }
                          },
                          child: const Icon(
                            Icons.image_outlined,
                            color: Colors.white,
                          ),
                        ),
                        controller.isLightOn
                            ? const Icon(Icons.flashlight_on_outlined,
                                color: Colors.white)
                            : Icon(Icons.flashlight_off_outlined,
                                color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                  (controller.result != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(controller.result?.format ?? '')}   Data: ${controller.result?.code ?? ''}',
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          'Align the QR within the center',
                          style: BalooStyles.baloosemiBoldTextStyle(
                              size: 17.sp, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
