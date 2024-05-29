import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:moto_park/navigation/navigation.dart';

class QrCodeController extends SuperController{
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrViewController;
  ScanController controller = ScanController();

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
    controller.scannedDataStream.listen((scanData) {
        result = scanData;
        update();
        Get.toNamed(AppRoutes.subscriptionScreen,arguments: {"result":result});
        if (Platform.isAndroid) {
          qrViewController!.pauseCamera();
        } else if (Platform.isIOS) {
          qrViewController!.resumeCamera();
        }
        Get.forceAppUpdate();
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
}



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
