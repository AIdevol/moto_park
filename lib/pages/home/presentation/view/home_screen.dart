
import 'package:animated_list_item/animated_list_item.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appbar_animated/appbar_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/constants/images.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/edit_profile_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/views/QRcode_information.dart';
import 'package:moto_park/pages/Authentication/presentation/views/QRcode_screen.dart';
import 'package:moto_park/pages/home/presentation/controlers/home_controller.dart';
import 'package:moto_park/pages/home/presentation/widget/drawer_screen.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen( {super.key});
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey();
  HomeController homeController = Get.put(HomeController());
  EditProfileController editProfileController = Get.put(EditProfileController());
  static const colorizeColors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.deepOrangeAccent,
    Colors.black,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Horizon',
  );





  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Moto Park",
        style: BalooStyles.baloomediumTextStyle(color: Colors.black),
      ),
      leadingWidth: 35,
      leading: InkWell(
        onTap: () => drawerkey.currentState?.openDrawer(),
        child: Image.asset(
          menuSvg,
          color: Colors.black,
          height: 10,
          width: 10,
        ),
      ).paddingOnly(left: 10),
      actions: [
        InkWell(
          onTap: () {
            Get.toNamed('/notification');
          },
          child: Container(
            height: 22,
            width: 22,
            child: const Icon(
              Icons.notifications,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        hGap(10),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.addVehicle);
          },
          child: Container(
            height: 22,
            width: 22,
            child: const Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),
        hGap(10),
        InkWell(
          onTap: () {
            Get.toNamed("/QrCodeInform");
          },
          child: Container(
            height: 22,
            width: 22,
            child: const Icon(
              Icons.qr_code_scanner_sharp,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        hGap(10),
      ],
    );
  }

  _textAnimated() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          scannerPng,
          height: 70,
          width: 70,
        ),
        SizedBox(
          width: Get.width,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText('Moto Park',
                  textStyle: colorizeTextStyle,
                  speed: const Duration(milliseconds: 500),
                  colors: colorizeColors,
                  textAlign: TextAlign.center),
              ColorizeAnimatedText('Coming your way',
                  textStyle: colorizeTextStyle,
                  speed: const Duration(milliseconds: 500),
                  colors: colorizeColors,
                  textAlign: TextAlign.center),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
        vGap(10),
        Image.asset(
          parkingPng,
          height: 50,
          width: 50,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<HomeController>(builder: (controller) {
        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            key: drawerkey,
            resizeToAvoidBottomInset: true,
            drawer: DrawerScreen(

              dkey: drawerkey,
              onLogoutTap:() =>{controller.hitApiToLogout(),},
        editProfileController: editProfileController,
            ),
            body: ScaffoldLayoutBuilder(
              backgroundColorAppBar:
                  const ColorBuilder(Colors.transparent, appColor),
              textColorAppBar: const ColorBuilder(Colors.white),
              appBarBuilder: _appBar,
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.4,
                      color: appColor,
                      child: _textAnimated(),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: Get.height * 0.35,
                      ),
                      height: Get.height * .9,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          vGap(40),
                          _vehicleTile(),
                          vGap(Get.height * .25),
                          // _boderLineButton("Add Vehicle",
                          //     onTap: () => Get.toNamed(AppRoutes.addVehicle)),
                          // vGap(40),
                          // _boderLineButton("Licence", onTap: () {
                          //   toast("No Licence Available");
                          //   Get.toNamed(AppRoutes.subscriptionScreen);
                          // })
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 0),
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.42,
                      child: Image.asset(
                        bgImage3,
                        opacity: const AlwaysStoppedAnimation(.03),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  _openVehicleDetailBottomSheet() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          width: Get.width,
          constraints: BoxConstraints(
            maxHeight: Get.height * 0.4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Actions',
                style:
                    BalooStyles.baloosemiBoldTextStyle(color: Colors.black87),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.titleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("Tapped on item at index $index");
                        controller.onTitleTapped(controller.titleList[index]);
                        Transition.zoom;
                      },
                      child: AnimatedListItem(
                        index: index,
                        length: controller.titleList.length,
                        aniController: controller.animationController,
                        animationType: AnimationType.zoom,
                        child: _text(controller.titleList[index]),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      isScrollControlled:
          true, 
    );
  }

  Widget _vehicleTile() {
    return InkWell(
      onTap: () {
        controller.animationController.forward();
      
        _openVehicleDetailBottomSheet();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: lightShadow),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 0,
          leading: Container(
            padding: const EdgeInsets.all(11),
            margin: EdgeInsets.only(right: 20),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: appColor),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "moto",
                  style: TextStyle(fontWeight: FontWeight.bold, height: 0),
                  textAlign: TextAlign.center,
                ).paddingOnly(top: 1),
                const Text(
                  "park",
                  style: TextStyle(fontWeight: FontWeight.bold, height: 0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          title: Text(
            'PB56AB1234',
            style: BalooStyles.balooboldTextStyle(color: Colors.black),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            'Bently Bentlgya',
            style: BalooStyles.baloonormalTextStyle(color: Colors.grey),
            textAlign: TextAlign.start,
          ),
          trailing: const Icon(
            Icons.arrow_forward_outlined,
            color: Colors.grey,
            size: 14,
          ),
        ),
      ),
    );
  }

  Widget _boderLineButton(text, {required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
            color: appColor),
        child: Text(
          text,
          style: BalooStyles.balooboldTextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _text(title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: Text(
        title,
        style: BalooStyles.baloomediumTextStyle(color: Colors.black87),
      ).paddingOnly(left: 10),
    );
  }
}

class Clipp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

  // Call HomeController's onTitleTapped method when a title is tapped
  // void _onTitleTapped(String title) {
  //   GetxController.onTitleTapped(title);
  // }
}
