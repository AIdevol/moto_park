
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moto_park/pages/home/presentation/widget/section_pages/help_center.dart';

import '../../../../constants/color_constants.dart';
import '../../../../navigation/navigation.dart';
import '../../../../services/APIs/auth_service/auth_api_service.dart';
import '../../../../utilities/google_font_text_style.dart';
import '../../../../utilities/helper_widget.dart';
import '../../../Authentication/presentation/controllers/edit_profile_controller.dart';
import 'heroWidget.dart';

class DrawerScreen extends StatefulWidget {
  final formGlobalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> dkey;
  final Function() onLogoutTap;
  final Function() ondeleteTap;
  final String? userName;
  final String? phone;
  final String? email;
  final EditProfileController editProfileController;



  DrawerScreen({
    Key? key,
    required this.dkey,
    required this.onLogoutTap,
    required this.ondeleteTap,
    required this.editProfileController,
    this.email,
    this.phone,
    this.userName,
  }) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 15),
            height: isExpanded ? MediaQuery.of(context).size.height * 0.36 : 168,
            color: appColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => showHeroWidget(context),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Hero(
                            tag: 'avatarimage',
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/22.jpg'),
                            ),
                          ),
                        ),
                      ),
                      hGap(40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<EditProfileController>(
                            init: widget.editProfileController, // Ensure controller is initialized here
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.firstNameController.text}',
                                    style: TextStyle(color: blackColor),
                                  ),
                                  Text(
                                    '${controller.phoneController.text}',
                                    style: TextStyle(color: blackColor),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        margin: EdgeInsets.only(left: 240),
                        child: IconButton(
                          icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                      ),
                      if (isExpanded) ..._moreOptions()
                    ],
                  ),
                ],
              ),
            ),
          ),
          vGap(10),
          divider(),
          menuTile(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              Get.back();
            },
          ),
          divider(),
          menuTile(
            icon: Icons.settings_outlined,
            title: "Settings",
            onTap: () {
              Get.toNamed(AppRoutes.editProfile);
            },
          ),
          divider(),
          menuTile(
            icon: Icons.change_circle_outlined,
            title: "Change Password",
            onTap: () {
              Get.toNamed(AppRoutes.changePassword);
            },
          ),
          divider(),
          menuTile(
            icon: Icons.star_half_outlined,
            title: "Rate the app",
            onTap: () => showRateAppDialog(context,
                appStoreId: 'YOUR_APP_STORE_ID',
                packageName: 'YOUR_ANDROID_PACKAGE_NAME'),
          ),
          divider(),
          menuTile(
            icon: Icons.remove_circle_outline,
            title: "Delete Account",
            onTap: () {
              showDeleteDialog();
            },
          ),
          divider(),
          menuTile(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              showLogoutDialog();
            },
          )
        ],
      ),
    );
  }

  void showLogoutDialog() {
    Get.defaultDialog(
      backgroundColor: Colors.yellow,
      title: "Logout",
      titleStyle: BalooStyles.balooboldTextStyle(color: Colors.black87, size: 15),
      content: Text(
        "Are you sure want to log out?",
        style: BalooStyles.baloomediumTextStyle(color: Colors.black87, size: 15),
      ),
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: widget.onLogoutTap,
      onCancel: () {
        Get.back();
      },
    );
  }
  void showDeleteDialog() {
    Get.defaultDialog(
      backgroundColor: Colors.yellow,
      title: "Delete Account",
      titleStyle: BalooStyles.balooboldTextStyle(color: Colors.black87, size: 15),
      content: Text(
        "Are you sure want to Delete Account?",
        style: BalooStyles.baloomediumTextStyle(color: Colors.black87, size: 15),
      ),
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: widget.ondeleteTap,
      onCancel: () {
        Get.back();
      },
    );
  }

  void showHeroWidget(BuildContext context) {
    Get.to(CustomHeroWidget(
      // imageUrl: profil
      /*imageUrl: 'https://randomuser.me/api/portraits/men/22.jpg',)*/
    ));
  }

  Widget menuTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: darkBlue),
                hGap(30),
                Text(title, style: BalooStyles.baloosemiBoldTextStyle(color: Colors.black87)),
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined, size: 14, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  List<Widget> _moreOptions() => [
    divider(),
    Container(
      padding: EdgeInsets.only(left: 16.0),
      child: menuTile(
        icon: Icons.credit_card_outlined,
        title: "Subscriptions",
        onTap: () => {Get.toNamed(AppRoutes.subscriptionScreen)},
      ),
    ),
    vGap(08),
    Container(
      padding: EdgeInsets.only(left: 16.0),
      child: menuTile(
        icon: Icons.help_center,
        title: "Help Center",
        onTap: () {
          Get.to(HelpCenter());
        },
      ),
    ),
  ];
}

void showRateAppDialog(BuildContext context, {required String appStoreId, required String packageName}) {
  var size = MediaQuery.of(context).size; // Gets the size of the current context

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Rate App",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "Would you mind rating our app? It won't take more than a minute and helps to promote our app. Thanks for your support!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Rate Now"),
                    onPressed: () {
                      // Open respective store link for rating
                      // If Android
                      // LaunchReview.launch(androidAppId: packageName);
                      // If iOS
                      // LaunchReview.launch(iOSAppId: appStoreId);
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text("Later"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
