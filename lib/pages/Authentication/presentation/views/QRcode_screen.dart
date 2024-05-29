import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/qr_code_controller.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:moto_park/utilities/image_picker.dart';

import '../../../../services/APIs/local_keys.dart';

class ScanQrScreen extends GetView<QrCodeController> {
  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<QrCodeController>(builder: (controller) {
        return Scaffold(body: _mainBody());
      }),
    );
  }

  Widget _mainBody() {
    return /*ListView(
      children: [
        backAppBar(appColor: Colors.transparent),
        vGap(50.sp),
        Text(
          "Scan QR Code",
          style: BalooStyles.baloosemiBoldTextStyle(size: 20),
          textAlign: TextAlign.center,
        ).marginSymmetric(vertical: 20),
        Text(
          "Open scanner or smart camera to scan the QR",
          style: BalooStyles.baloosemiBoldTextStyle(size: 18),
          textAlign: TextAlign.center,
        ).marginSymmetric(horizontal: 20),
        vGap(55),
        Image.asset("assets/QR1.jpg",height: 200.sp,width: 230.sp,fit: BoxFit.contain,),
        // _rememberOrForgotView(controller: controller),

        vGap(55),
        GradientButton(
          onTap: () {
            // if (formGlobalKey.currentState?.validate() ?? false) {
            //   controller.hitLoginAPI();
            // }
            storage.write(isVerifiedQr, true);

            Get.toNamed(AppRoutes.subscriptionScreen);
          },
          name: 'Proceed',
        ).marginOnly(bottom: 20,left: 15.sp,right: 15.sp),
        vGap(40),

      ],
    )*/
        Column(
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
                    borderColor: darkBlue),
                onQRViewCreated: controller.onQRViewCreated,
                onPermissionSet: (QRViewController contro, result) {},
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 15.sp),
              color: darkBlue,
              alignment: Alignment.center,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.qrViewController?.toggleFlash();
                        controller.isLightOn = !controller.isLightOn;
                        controller.update();
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
                              )),
                          controller.isLightOn
                              ? const Icon(Icons.flashlight_on_outlined,
                                  color: Colors.white)
                              : Icon(
                                  Icons.flashlight_off_outlined,
                                  color: Colors.grey.shade400,
                                ),
                        ],
                      )),
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
              )),
        )
      ],
    );
  }
}
