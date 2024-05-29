// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moto_park/constants/color_constants.dart';
// import 'package:moto_park/pages/Authentication/presentation/controllers/edit_profile_controller.dart';
// import 'package:moto_park/utilities/google_font_text_style.dart';
//
// import '../../../../response_model/register_response_model.dart';
//
// class DocumentVisible extends GetView<EditProfileController> {
//   const DocumentVisible({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double padding = width * 0.05;
//     double avatarRadius = width * 0.13;
//     double textFontSize = width * 0.04;
//     double labelFontSize = width * 0.04;
//     double sectionSpacing = width * 0.05;
//
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Padding(
//             padding: EdgeInsets.all(padding),
//             child: Card(
//               color: Colors.yellow[50],
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(padding),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         'User Details',
//                         style: BalooStyles.balooboldTextStyle(
//                             color: blackColor,
//                             size: textFontSize * 1.2
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: sectionSpacing),
//                     Center(
//                       child: GetBuilder<EditProfileController>(
//                         builder: (controller) {
//                           if (controller.isLoading) {
//                             return const CircularProgressIndicator();
//                           }
//                           return CircleAvatar(
//                             radius: avatarRadius,
//                             // Display user's profile image if available
//                             backgroundImage: controller.profileImg.isNotEmpty
//                                 ? NetworkImage(controller.profileImg)
//                                 : null,
//                             child: controller.profileImg.isEmpty
//                                 ? Icon(Icons.person, size: avatarRadius)
//                                 : null,
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: sectionSpacing),
//                     GetBuilder<EditProfileController>(
//                       builder: (controller) {
//                         if (controller.isLoading) {
//                           return const SizedBox.shrink();
//                         }
//
//                         UserDetails? userDetails = controller.userDetails?.value;
//
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             TextRow(
//                               label: 'Name:',
//                               value: '${userDetails.firstName ?? ''} ${userDetails.lastName ?? ''}',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                             TextRow(
//                               label: 'Email:',
//                               value: userDetails.email ?? '',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                             TextRow(
//                               label: 'Phone Number:',
//                               value: userDetails.phone ?? '',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                             TextRow(
//                               label: 'Gender:',
//                               value: userDetails.gender ?? '',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                             Container(
//                               height: sectionSpacing,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Emergency Contacts",
//                                   style: TextStyle(
//                                     fontFamily: 'sans-serif',
//                                     fontSize: labelFontSize,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             TextRow(
//                               label: 'Emergency Contact 1:',
//                               value: userDetails.emergencyContact ?? '',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                             TextRow(
//                               label: 'Emergency Contact 2:',
//                               value: userDetails.emergencyContact2 ?? '',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                             TextRow(
//                               label: 'Blood Group:',
//                               value: userDetails.bloodGroup ?? '',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                             TextRow(
//                               label: 'Date of Birth:',
//                               value: userDetails.dateOfBirth ?? '',
//                               labelFontSize: labelFontSize,
//                               valueFontSize: textFontSize,
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class TextRow extends StatelessWidget {
//   final String label;
//   final String value;
//   final double labelFontSize;
//   final double valueFontSize;
//
//   const TextRow({
//     Key? key,
//     required this.label,
//     required this.value,
//     required this.labelFontSize,
//     required this.valueFontSize,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: labelFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(fontSize: valueFontSize),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';

import '../../../../utilities/helper_widget.dart';
import '../../../Authentication/presentation/controllers/edit_profile_controller.dart';

class DocumentVisible extends StatelessWidget {
  const DocumentVisible({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final EditProfileController controller = Get.put(EditProfileController());

    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(16.0),
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
                          Text(
                            'Address:',
                            style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                          ),
                          Text(
                            '${controller.addressController.text}',
                            style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                          ),
                          vGap(10),
                          Row(
                            children: [
                              Text(
                                'Date of Birth:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                              ),
                              hGap(10),
                              Text(
                                '${controller.dobController.text}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
                          vGap(10),
                          Row(
                            children: [
                              Text(
                                'Blood Group:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 15),
                              ),
                              hGap(10),
                              Text(
                                '${controller.bloodGroupController.text}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
                          vGap(10),
                          Row(
                            children: [
                              Text(
                                'Emergency Contact 1:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                              ),
                              hGap(10),
                              Text(
                                '${controller.emergencyContactController.text}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
                          vGap(10),
                          Row(
                            children: [
                              Text(
                                'Emergency Contact 2:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                              ),
                              hGap(10),
                              Text(
                                '${controller.emergencyContactController2.text}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
                          vGap(10),
                          Row(
                            children: [
                              Text(
                                'Gender:',
                                style: BalooStyles.baloomediumTextStyle(color: Color(0xFF808080), size: 18),
                              ),
                              hGap(10),
                              Text(
                                '${controller.dropDownValue}',
                                style: BalooStyles.baloomediumTextStyle(color: blackColor, size: 15),
                              ),
                            ],
                          ),
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