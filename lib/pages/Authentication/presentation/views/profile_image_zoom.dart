import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ProfileZoom extends StatelessWidget {
  ProfileZoom({super.key,required this.imagePath});

  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.0),
      appBar: backAppBar(title: ""),
      body: imagePath!=""?  Hero(
        tag: "profile",
        child: PinchZoom(
          child: Center(
            child: Container(
              color: appColor.withOpacity(.1),
              height: Get.height*.47,
              // width: Get.width,
              child:imagePath.startsWith("http")? Image.network(imagePath,fit: BoxFit.contain,):Image.file(File(imagePath)),
            ),
          ),
        ),
      ):Container(),
    );
  }
}
