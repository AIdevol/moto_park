import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScreenController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrViewController;
  ScanController controller = ScanController();

  bool isLightOn = false;
  File? galleyPath;

  @override
  void reassemble() {
    if (Platform.isAndroid) {
      qrViewController!.resumeCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
    Get.forceAppUpdate();
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      update();
      handleScannedData(scanData.code ?? '');
    });
  }

  void handleScannedData(String scannedData) {
    List<String> parts = scannedData.split(':');
    if (parts.length == 2) {
      String owner = parts[0];
      String phoneNumber = parts[1];
      showContactDialog(owner, phoneNumber);
    } else {
      Get.snackbar("Error", "Invalid QR code format");
    }
  }

  Future<void> showContactDialog(String owner, String phoneNumber) async {
    Get.dialog(
      AlertDialog(
        backgroundColor: appColor,
        title: Text('Contact $owner:'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Send Message', style: BalooStyles.baloomediumTextStyle(color: blackColor),),
                onTap: () async {
                  await sendMessage(phoneNumber);
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Call $owner',style: BalooStyles.baloomediumTextStyle(color: blackColor),),
                onTap: () async {
                  await callOwner(phoneNumber);
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendMessage(String phoneNumber) async {
    String message = '';
    Uri uri = Uri(
        scheme: 'sms', path: phoneNumber, queryParameters: {'body': message});

    if (await launchUrl(uri)) {
      Get.back();
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> callOwner(String phoneNumber) async {
    Uri uri = Uri(scheme: 'tel', path: phoneNumber);

    if (await launchUrl(uri)) {
      Get.back();
    } else {
      throw 'Could not launch $uri';
    }
  }

  void toggleFlashlight() {
    if (qrViewController != null) {
      qrViewController!.toggleFlash();
      isLightOn = !isLightOn;
      update();
    }
  }


  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    galleyPath = File("");
    super.onInit();
  }
}
