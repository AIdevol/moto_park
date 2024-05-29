import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class CustomTooltip extends StatelessWidget {
  CustomTooltip(
      {super.key,
      this.desc,
      this.heading,
      required this.child,
      this.textAlign,
      this.style});

  String? heading = "";
  String? desc = "";

  Widget child;
  TextAlign? textAlign;
  TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      verticalOffset: 10,
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      // height: Get.height*.2,
      richMessage: WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: AnimatedContainer(
          padding: const EdgeInsets.all(10),
          // width: Get.width*.5,
          constraints: const BoxConstraints(maxWidth: 250),
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading ?? '',
                style: BalooStyles.baloonormalTextStyle(
                    size: Get.width * .015,
                    color: Colors.black,
                    weight: FontWeight.w500),
                textAlign: textAlign ?? TextAlign.start,
              ),
              vGap(5.sp),
              Text(
                desc ?? '',
                style: style ??
                    BalooStyles.baloonormalTextStyle(
                        size: Get.width * .0115, color: Colors.black),
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: child,
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class CustomTooltip extends StatelessWidget {
   CustomTooltip({super.key,this.desc,this.heading,required this.child});

  String? heading ="";
  String? desc ="";

  Widget child;

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      showBarrier: true,
      showDropBoxFilter: true,
      shadowColor: Colors.black45,
      sigmaX: 5,
      sigmaY: 5,
      borderColor: Colors.transparent,
      elevation: 6,
      backgroundColor: darkBlue,
      content:Container(
        padding: EdgeInsets.all(10),
        width: Get.width*.3,
        constraints:
         BoxConstraints(maxWidth: Get.width*.3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading??'',
              style: BalooStyles.baloonormalTextStyle(
                  size: Get.width * .015, color: Colors.cyanAccent,weight: FontWeight.w500),
              textAlign: TextAlign.start,
            ),
            vGap(5.sp),
            Text(desc??'',style: BalooStyles.baloonormalTextStyle(size: Get.width*.01),maxLines: 10,),
          ],
        ),
      ),
      child: child,
    );
  }
}
*/
