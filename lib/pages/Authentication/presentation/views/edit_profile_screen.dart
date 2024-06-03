import 'dart:io';
import 'package:appbar_animated/appbar_animated.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moto_park/constants/images.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/edit_profile_controller.dart';
import 'package:moto_park/pages/Authentication/presentation/views/profile_image_zoom.dart';
import 'package:moto_park/utilities/common_textfield.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';
import 'package:moto_park/utilities/loading_indicator.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/Extension/text_field_extenstion.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utilities/networl_shimmer_image.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);
  final formGlobalKeyEdit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<EditProfileController>(builder: (controller) {
        return Scaffold(
          // body: Container(
          //     height: Get.height,
          //     width: Get.width,
          //     color: Colors.black.withOpacity(0),child: _mainBody()),
          backgroundColor: Colors.black.withOpacity(.0),
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          body: ScaffoldLayoutBuilder(
            backgroundColorAppBar:
                const ColorBuilder(Colors.transparent, appColor),
            textColorAppBar: const ColorBuilder(Colors.white),
            appBarBuilder: profileBackAppbar,
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * 0.44,
                    color: appColor,
                    child: Stack(
                      children: [
                        Positioned(
                            top: Get.height * .11,
                            left: 0,
                            right: 0,
                            child: controller.profileImg != "" &&
                                    !controller.profileImg.startsWith("http")
                                ? Hero(
                                    tag: "profile",
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => ProfileZoom(
                                            imagePath: controller.profileImg));
                                      },
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: FileImage(File(
                                              controller.profileImg,
                                            ))),
                                            border: Border.all(
                                                color: Colors.white)),
                                      ),
                                    ),
                                  )
                                : controller.profileImg.startsWith("http")
                                    ? Hero(
                                        tag: "profile",
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => ProfileZoom(
                                                imagePath:
                                                    controller.profileImg));
                                          },
                                          child: CircleAvatar(
                                            radius: 70,
                                            child: CustomCacheNetworkImage(
                                              controller.profileImg,
                                              height: 120,
                                              width: 120,
                                              radiusAll: 100,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade700,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Image.asset(prouserSvg)
                                            .paddingAll(0),
                                      )),
                        Positioned(
                            top: Get.height * .22,
                            left: 0,
                            right: -Get.width * .2,
                            child: InkWell(
                                onTap: () {
                                  _showBottomSheet();
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 14,
                                    )))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: Get.height * 0.31, left: 10, right: 10),
                    height: Get.height * 1.3,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        vGap(20),
                        _form(context: Get.context!)
                            .paddingSymmetric(horizontal: 8),
                        GradientButton(
                          onTap: () {
                            if (formGlobalKeyEdit.currentState?.validate() ??
                                false) {
                              Get.toNamed(AppRoutes.editProfile, arguments: {
                                'profile': controller.profileImg
                              });/*?.then((_){
                                Get.find<EditProfileController>().updateUserProfile();

                                controller.hitGetUserProfileAPI();
                              });*/
                              Get.find<EditProfileController>().updateUserProfile();
                              print("Button tapped...");

                            }
                          },
                          name: 'Update',
                        ).marginOnly(bottom: 20, left: 10, right: 10, top: 20),
                      ],
                    ).paddingSymmetric(horizontal: 10, vertical: 0),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _main() {
    return Column(
      children: [
        Container(
          height: Get.height * .45,
          decoration: const BoxDecoration(
              color: appColor,
              // color: appColor,
              // gradient: appBarGradient(),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),

          // child: Image.asset(resetPassBg)
        ),
      ],
    );
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      height: Get.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: Get.height * .45,
                        decoration: const BoxDecoration(
                            color: appColor,
                            // color: appColor,
                            // gradient: appBarGradient(),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),

                        // child: Image.asset(resetPassBg)
                      )),
                  Positioned(
                      top: Get.height * .1,
                      left: 0,
                      right: 0,
                      child: controller.profileImg != "" &&
                              !controller.profileImg.startsWith("http")
                          ? Hero(
                              tag: "profile",
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => ProfileZoom(
                                      imagePath: controller.profileImg));
                                },
                                child: Container(
                                  height: 135,
                                  width: 135,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: FileImage(File(
                                        controller.profileImg,
                                      ))),
                                      border: Border.all(color: Colors.white)),
                                ),
                              ),
                            )
                          : controller.profileImg.startsWith("http")
                              ? Hero(
                                  tag: "profile",
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => ProfileZoom(
                                          imagePath: controller.profileImg));
                                    },
                                    child: CircleAvatar(
                                      radius: 70,
                                      child: CustomCacheNetworkImage(
                                        controller.profileImg,
                                        height: 135,
                                        width: 135,
                                        radiusAll: 100,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade700,
                                      border: Border.all(color: Colors.white)),
                                  child: Image.asset(prouserSvg).paddingAll(0),
                                )),
                  Positioned(
                      top: Get.height * .22,
                      left: 0,
                      right: -Get.width * .2,
                      child: InkWell(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 14,
                              )))),
                  Positioned(
                    left: 15,
                    right: 15,
                    bottom: 0,
                    top: Get.height * .29,
                    child: Container(
                      height: Get.height,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500, blurRadius: 7)
                          ]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 15),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _form(context: Get.context!)
                              .paddingSymmetric(horizontal: 8),
                          vGap(30),
                          GradientButton(
                            onTap: () {
                              print("Button tapped...");
                              if (formGlobalKeyEdit.currentState?.validate() ??
                                  false) {
                                Get.toNamed(AppRoutes.editProfile, arguments: {
                                  'profile': controller.profileImg
                                })?.then((_) {
                                  // This code block executes after returning from the editProfile screen
                                  // Get.find<EditProfileController>().updateUserProfile();

                                  // controller.hitGetUserProfileAPI();
                                });
                              }
                            },
                            name: 'Update',
                          ).marginOnly(bottom: 20, left: 10, right: 10),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 40,
                      left: 15,
                      child: Row(
                        children: [
                          backIcon(),
                          hGap(Get.width * .28),
                          Text(
                            'Profile',
                            style: BalooStyles.balooboldTextStyle(
                                color: Colors.black),
                          ).paddingOnly(left: 20)
                        ],
                      )),
                ],
              ),
              Visibility(
                visible: controller.isLoading,
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.black.withOpacity(.5),
                  child: const LoadingIndicator(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _form({required BuildContext context}) {
    return Form(
        key: formGlobalKeyEdit,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _firstNameFieldView(context: context),
            vGap(16),
            _emailFieldView(context: context),
            vGap(16),
            _phoneFieldView(context: context),
            vGap(16),
            _genderView(context: context),
            vGap(16),
            _addressFieldView(context: context),
            vGap(20),
            _title("Emergency Contact Details"),
            vGap(20),
            _emergencyContactFieldView(context: context),
            vGap(16),
            _emergencyContactFieldView2(context: context),
            vGap(16),
            _bloodGroupFieldView(context: context),
            vGap(16),
            _dobFieldView(context: context),
          ],
        ));
  }

  _title(title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
        color: Colors.grey.shade300,
        child: Text(
          title,
          style: BalooStyles.baloomediumTextStyle(
              size: 14.sp, color: Colors.black),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  _firstNameFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Name",
        labletext: "Name",
        controller: controller.firstNameController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.emailFocusNode);
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Name");
        },
        focusNode: controller.firstNameFocusNode);
  }

  _addressFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Address",
        labletext: "Address",
        controller: controller.addressController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.passwordFocusNode);
        },
        suffix: InkWell(
            onTap: () => controller.getCurrentPosition(),
            child: Container(
              height: 20,
              width: 30,
              child: const Icon(
                Icons.location_on_outlined,
                color: darkBlue,
              ),
            )),
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Address");
        },
        focusNode: controller.addressFocusNode);
  }

  _emailFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Email",
        labletext: "Email",
        controller: controller.emailController,
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.phoneFocusNode);
        },
        validator: (value) {
          return value?.isValidEmail();
        },
        focusNode: controller.emailFocusNode);
  }

  _phoneFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Phone",
        labletext: "Phone",
        controller: controller.phoneController,
        textInputType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.passwordFocusNode);
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        /*  suffix: _verifyPhoneButton(
            onTap: () => controller.getVerifyContactApi(
                controller.countryCodeVal + controller.phoneController.text,
                1),text: isVerifyContact1?"Verified":"Verify"),*/
        validator: (value) {
          if (value!.isEmpty) {
            return "Phone number";
          }
        },
        prefix: Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              // color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 0.5),
            ),
            child: CountryCodePicker(
                flagWidth: 15.0,
                initialSelection: 'IN',
                boxDecoration: const BoxDecoration(color: Colors.transparent),
                showCountryOnly: true,
                onChanged: (value) {
                  controller.countryCodeVal = value.dialCode.toString();
                  controller.update();
                })),
        focusNode: controller.phoneFocusNode);
  }

  _emergencyContactFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Emergency Contact",
        labletext: "Emergency Contact",
        controller: controller.emergencyContactController,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.emergencyContactFocusNode2);
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Enter Emergency Contact");
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        prefix: Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              // color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 0.5),
            ),
            child: CountryCodePicker(
                flagWidth: 15.0,
                initialSelection: 'IN',
                boxDecoration: const BoxDecoration(color: Colors.transparent),
                showCountryOnly: true,
                onChanged: (value) {
                  controller.emgContactCodeVal = value.dialCode.toString();
                  controller.update();
                })),
        /*      suffix: _verifyPhoneButton(
            onTap: () => controller.getVerifyContactApi(
                controller.emgContactCodeVal +
                    controller.emergencyContactController.text,
                2),text: isVerifyContact2?"Verified":"Verify"),*/
        focusNode: controller.emergencyContactFocusNode);
  }

  _verifyPhoneButton({Function()? onTap, text}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: BalooStyles.baloosemiBoldTextStyle(color: Colors.green),
        textAlign: TextAlign.center,
      ).paddingOnly(right: 10, top: 15),
    );
  }

  _emergencyContactFieldView2({required BuildContext context}) {
    return CustomTextField(
        hintText: "2nd Emergency Contact",
        labletext: "2nd Emergency Contact",
        controller: controller.emergencyContactController2,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.bloodGroupFocusNode);
        },
        validator: (value) {
          return value?.isEmptyField(
              messageTitle: "Enter Second Emergency Contact");
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        /*       suffix: _verifyPhoneButton(
            onTap: () => controller.getVerifyContactApi(
                controller.emgContactCodeVal2 +
                    controller.emergencyContactController2.text,
                3),text: isVerifyContact3?"Verified":"Verify"), */
        prefix: Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              // color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 0.5),
            ),
            child: CountryCodePicker(
                flagWidth: 15.0,
                initialSelection: 'IN',
                boxDecoration: const BoxDecoration(color: Colors.transparent),
                showCountryOnly: true,
                onChanged: (value) {
                  controller.emgContactCodeVal2 = value.dialCode.toString();
                  controller.update();
                })),
        focusNode: controller.emergencyContactFocusNode2);
  } // emergency Contact details form

  _dobFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Date of Birth",
        labletext: "Date of Birth",
        readOnly: true,
        controller: controller.dobController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.bloodGroupFocusNode);
        },
        onTap: () => controller.selectDate(Get.context!),
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Select Date of Birth");
        },
        focusNode: controller.dobFocusNode);
  }

  _bloodGroupFieldView({required BuildContext context}) {
    return CustomTextField(
        hintText: "Blood Group",
        labletext: "Blood Group",
        controller: controller.bloodGroupController,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context).unfocus();
        },
        validator: (value) {
          return value?.isEmptyField(messageTitle: "Enter Blood Group");
        },
        focusNode: controller.bloodGroupFocusNode);
  }

  _genderView({required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender' ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(left: 2, bottom: 5),
        Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100,
                boxShadow: lightShadow),
            child: verticalDot(context)),
      ],
    );
  }

  verticalDot(context) {
    return DropdownButton(
        elevation: 1,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsets.zero,
        value: controller.dropDownValue,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: controller.genderType.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: SizedBox(
                width: Get.width,
                child: Text(items, style: BalooStyles.baloonormalTextStyle())),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.dropDownValue = newValue ?? '';
          // storage.write(USERType, controller.dropDownValue);
          print("storage.read(userType)");
          print(storage.read(controller.dropDownValue));
          controller.update();
        });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.white.withOpacity(.9),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            children: [
              //pick profile picture label
              Text('Pick Profile Picture',
                  textAlign: TextAlign.center,
                  style: BalooStyles.baloonormalTextStyle(
                      weight: FontWeight.w500, color: Colors.black)),
              //for adding some space
              vGap(15),
              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 100);
                        if (image != null) {
                          await _cropImage(image.path);
                          // log('Image Path: ${image.path}');
                          // controller.profileImg = image.path;
                          controller.update();
                          // APIs.updateProfilePicture(File(_image!));
                          // for hiding bottom sheet
                          Get.back();
                        }
                      },
                      child: const Icon(
                        Icons.browse_gallery_outlined,
                        color: Colors.black,
                      )),

                  //take picture from camera button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 100);
                        if (image != null) {
                          // log('Image Path: ${image.path}');
                          //
                          // controller.profileImg = image.path;
                          await _cropImage(image.path);
                          controller.update();

                          // for hiding bottom sheet
                          Get.back();
                        }
                      },
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      )),
                ],
              )
            ],
          );
        });
  }

  Future _cropImage(String pickedFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      maxHeight: 250,
      maxWidth: 250,
      uiSettings: [
        AndroidUiSettings(
            hideBottomControls: true,
            showCropGrid: true,
            toolbarTitle: 'Cropper',
            toolbarColor: appColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        IOSUiSettings(
          rectHeight: 100,
          rectWidth: 100,
          rectX: 100,
          rectY: 100,
          resetAspectRatioEnabled: false,
          title: 'Cropper',
          aspectRatioLockEnabled: true,
          rotateClockwiseButtonHidden: true,
          rotateButtonsHidden: true,
          resetButtonHidden: true,
        ),
      ],
    );
    if (croppedFile != null) {
      controller.profileImg = croppedFile.path ?? '';
      controller.update();
      controller.hitApiToUpdateProfileLogo();
    }
  }
}
