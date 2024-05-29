import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';

import '../../../../utilities/helper_widget.dart';
import '../../../Authentication/presentation/controllers/edit_profile_controller.dart';

class CustomHeroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditProfileController controller = Get.put(EditProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leading: Icon(Icons.person_2_outlined, size: 30),
        title: Center(
          child: Text(
            'Profile',
            style: BalooStyles.baloomediumTextStyle(
              color: blackColor,
              size: 20,
            ),
          ),
        ),
        actions: [hGap(50)],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40,right: 10,left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Add your existing form fields here
              GetBuilder<EditProfileController>(
                builder: (controller) {
                  return Card(
                    color: Colors.yellow[50],
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/22.jpg"),
                            ),
                          ),
                          vGap(20),
                          Row(
                            children: [
                              Text(
                                'Name:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                              ),
                              hGap(10),
                              Text(
                                '${controller.firstNameController.text}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
                          vGap(10),
                          Row(
                            children: [
                              Text(
                                'Email:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                              ),
                              hGap(10),
                              Text(
                                '${controller.emailController.text}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
                          vGap(10),
                          Row(
                            children: [
                              Text(
                                'Phone:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                              ),
                              hGap(10),
                              Text(
                                '${controller.phoneController.text}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
                          vGap(10),
                          // Text(
                          //   'Address:',
                          //   style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                          // ),
                          // Text(
                          //   '${controller.addressController.text}',
                          //   style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                          // ),
                          // vGap(10),
                          // Text(
                          //   'Date of Birth:',
                          //   style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                          // ),
                          // Text(
                          //   '${controller.dobController.text}',
                          //   style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                          // ),
                          // vGap(10),
                          // Text(
                          //   'Blood Group:',
                          //   style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 15),
                          // ),
                          // Text(
                          //   '${controller.bloodGroupController.text}',
                          //   style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                          // ),
                          // vGap(10),
                          // Text(
                          //   'Emergency Contact 1:',
                          //   style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                          // ),
                          // Text(
                          //   '${controller.emergencyContactController.text}',
                          //   style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                          // ),
                          // vGap(10),
                          // Text(
                          //   'Emergency Contact 2:',
                          //   style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                          // ),
                          // Text(
                          //   '${controller.emergencyContactController2.text}',
                          //   style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                          // ),
                          // vGap(10),
                          // Text(
                          //   'Gender:',
                          //   style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                          // ),
                          // Text(
                          //   '${controller.dropDownValue}',
                          //   style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}