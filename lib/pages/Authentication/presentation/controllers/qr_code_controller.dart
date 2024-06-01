import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/services/APIs/auth_service/auth_api_service.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:moto_park/navigation/navigation.dart';

class QrCodeController extends SuperController{
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrViewController;
  ScanController controller = ScanController();
  bool isVerifiedQr = true;
  bool isLightOn = false;

  File? galleyPath;

  void reassemble() {

    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
    Get.forceAppUpdate();
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      bool isSubscribed = await checkSubscription(scanData.code);

      if (isSubscribed) {
        toast("Already have subscription on this QR code");
        Get.back();
      } else {
        Get.toNamed(AppRoutes.subscriptionScreen, arguments: {"result": result});
        update();
        Get.offAllNamed(AppRoutes.homeScreen);
        if (Platform.isAndroid) {
          qrViewController!.pauseCamera();
        } else if (Platform.isIOS) {
          qrViewController!.resumeCamera();
        }
        Get.forceAppUpdate();
      }
    });
  }



  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    galleyPath = File("");
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  Future<bool> checkSubscription(scanData) async {
    try {
      bool isSubscribed = await Get.find<AuthenticationApiService>().checkSubscriptions(scanData);
      return isSubscribed;
    } catch (e) {
      toast(e.toString());
      return false;
    }
  }




}

  // saveVehicleDetails(vehicleDetails) {}





class jhfdg extends StatefulWidget {
  const jhfdg({super.key});

  @override
  State<jhfdg> createState() => _jhfdgState();
}

class _jhfdgState extends State<jhfdg> {

/*  @override
  void reassemble() {

    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController!.resumeCamera();
    }
    super.reassemble();
  }*/


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
