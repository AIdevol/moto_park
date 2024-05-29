import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/main.dart';
import 'package:moto_park/pages/Authentication/presentation/controllers/subscription_screen_controller.dart';
import 'package:moto_park/pages/payment/presentation/controlller/payment_controller.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/gradient_button.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class SubscriptionScreen extends GetView<SubscriptionScreenController> {
  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<SubscriptionScreenController>(builder: (controller) {
        return Scaffold(
            appBar: backAppBar(title: "Premium"),
            body:
                _mainBody() /* SimplePaywall(
             // set a custom header
               headerContainer: Container(
                   margin: const EdgeInsets.all(16),
                   height: 100,
                   decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                       image: DecorationImage(
                           fit: BoxFit.cover,
                           alignment: FractionalOffset.center,
                           image: AssetImage('assets/premium_bg.png'))),
                   child: Container()),
               // Title Bar
               title: "Unlock Your Subscription",
               // SubTitle
               subTitle: "All features at a glance",
               // Add as many bullet points as you like
               bulletPoints: const [
                 IconAndText(Icons.stop_screen_share_outlined, "No Ads"),
                 IconAndText(Icons.hd, "Premium HD"),
                 IconAndText(Icons.sort, "Access to All Premium Articles")
               ],
               // Your subscriptions that you want to offer to the user
               subscriptionListData: [
                 SubscriptionData(
                     durationTitle: "Yearly",
                     durationShort: "1 year",
                     price: "€14,99€",
                     dealPercentage: 69,
                     productDetails: "Dynamic purchase data",
                     index: 0),
                 SubscriptionData(
                     durationTitle: "Quarterly",
                     durationShort: "3 Months",
                     price: "€6,99",
                     dealPercentage: 42,
                     productDetails: "Dynamic purchase data",
                     index: 2),
                 SubscriptionData(
                     durationTitle: "Monthly",
                     durationShort: "1 month",
                     price: "3,99€",
                     dealPercentage: 0,
                     productDetails: "Dynamic purchase data",
                     index: 3)
               ],
               // Shown if isPurchaseSuccess == true
               successTitle: "Success!!",
               // Shown if isPurchaseSuccess == true
               successSubTitle: "Thanks for choosing Premium!",
               // Widget can be anything. Shown if isPurchaseSuccess == true
               successWidget: Container(
                   padding: const EdgeInsets.only(top: 16, bottom: 16),
                   child:
                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                     ElevatedButton(
                       child: const Text("Let's go!"),
                       onPressed: () {
                         print("let‘s go to the home widget again");
                       },
                     )
                   ])),
               activePlanList: const [
                 // links to the subscription overview on Android devices:
                 GooglePlayGeneralActivePlan(),

                 // links to the specific subscription on Android devices:
                 GooglePlayActivePlan("yearly_pro", "com.tnx.packed"),

                 // links to the subscription overview on iOS devices
                 AppleAppStoreActivePlan(),
               ],
               // set true if subscriptions are loading
               isSubscriptionLoading: false,
               // if purchase is in progress, set to true. this will show a fullscreen progress indicator
               isPurchaseInProgress: false,
               // to show the success widget
               purchaseState: PurchaseState.NOT_PURCHASED,
               // callback Interface for restore and purchase tap events. Extend DefaultPurchaseHandler
               callbackInterface: controller.purchaseHandler,
               purchaseStateStreamInterface: controller.purchaseHandler,
               // provide your TOS
               tosData:
               const TextAndUrl("Terms of Service", "https://www.linkfive.io/tos"),
               // provide your PP
               ppData:
               const TextAndUrl("Privacy Policy", "https://www.linkfive.io/privacy"),
               // add a custom campaign widget
               campaignWidget: CampaignBanner(
                 headline: "🥳 Summer Special Sale",
                 subContent: Container(
                     padding: const EdgeInsets.all(8),
                     child: CountdownTimer(
                       endTime: DateTime.now()
                           .add(const Duration(days: 2, hours: 7))
                           .millisecondsSinceEpoch,
                     )),
               ))*/

            ); /* return Scaffold(
            body: _mainBody()

        );*/
      }),
    );
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          // backAppBar(),
          // vGap(30.sp),
          Container(
              width: Get.width,
              margin: const EdgeInsets.all(16),
              height: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.center,
                    image: AssetImage('assets/premium_bg.png'),
                  )),
              child: Text(
                "A M C",
                style: BalooStyles.baloosemiBoldTextStyle(size: 25.sp),
                textAlign: TextAlign.center,
              ).marginSymmetric(vertical: 10)),

          Text(
            "Access to All Premium Articles",
            style: BalooStyles.baloonormalTextStyle(
                size: 19.sp, weight: FontWeight.w500),
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 15.sp),
          vGap(10),
          Text(
            "Unlock Your Subscription",
            style: BalooStyles.baloonormalTextStyle(
              size: 17.sp,
            ),
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 15.sp),
          Text(
            "All features at a glance",
            style: BalooStyles.baloonormalTextStyle(
              size: 16.sp,
            ),
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 15.sp, vertical: 10.sp),
          vGap(20.sp),
          subscriptionBuilder(),
          GradientButton(
            onTap: () {
              // if (formGlobalKey.currentState?.validate() ?? false) {
              //   controller.hitLoginAPI();
              // }

              var options = {
                'key': 'rzp_test_2P38XNePtDYveW',
                'amount': controller.selectedIndex == 0
                    ? 500 * 100
                    : controller.selectedIndex == 1
                        ? 400 * 100
                        : 370 * 100,
                'name': 'Weboapp',
                "currency": "INR",
                'description': 'Fine T-Shirt',
                'prefill': {
                  'contact': '8556972027',
                  'email': 'muskanflutterdev@gmail.com'
                }
              };
              storage.write(isSubscribed, true);
              Get.find<PaymentController>().razorpay.open(options);
              // Get.offAllNamed(AppRoutes.homeScreen);
            },
            name: 'Purchase',
          ).marginOnly(bottom: 20, left: 15, right: 15, top: 30),
        ],
      ),
    );
  }

  // Widget subscriptionBuilder() {
  //   return Container(
  //     height: 280.sp,
  //     // padding: EdgeInsets.symmetric(vertical: 30),
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       padding: EdgeInsets.only(top: 30),
  //       scrollDirection: Axis.horizontal,
  //       itemCount: controller.rupeesList.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return _subscriptionCard(index: index);
  //       },
  //     ),
  //   );
  // }

  Widget subscriptionBuilder() {
    return Container(
      height: 280.sp,
      // padding: EdgeInsets.symmetric(vertical: 30),
      child: CarouselSlider(
        items: controller.rupeesList.map((cardM) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: () {
                      // controller.selectedIndex = index;
                      controller.selectedRupee = cardM.rupees ?? '';
                      controller.update();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 15.sp),
                      margin: EdgeInsets.only(left: 15.sp, right: 10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 2,
                              color: /*controller.selectedIndex == index
                                ? Colors.lightGreenAccent
                                : Colors.black,*/
                                  Colors.lightGreenAccent),
                          gradient: splashGradient2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/membership.png",
                            height: 35.sp,
                            width: 35.sp,
                          ),
                          Text(
                            cardM.months ?? '',
                            style: BalooStyles.baloosemiBoldTextStyle(
                                color: Colors.pink),
                            textAlign: TextAlign.center,
                          ).marginSymmetric(vertical: 15),
                          Text(
                            cardM.timed ?? '',
                            style: BalooStyles.baloosemiBoldTextStyle(
                                color: Colors.black87),
                            textAlign: TextAlign.center,
                          ).marginSymmetric(vertical: 15),
                          Text(
                            cardM.rupees ?? '',
                            style: BalooStyles.baloosemiBoldTextStyle(
                                size: 20, color: Colors.black),
                            textAlign: TextAlign.center,
                          ).marginSymmetric(vertical: 10),
                        ],
                      ),
                    ),
                  ),
                  cardM.months == "Yearly"                                                                                                                                                                                                                                                    
                      ? Positioned(
                          left: 36.sp,
                          top: -20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: Colors.green),
                            child: Text(
                              "Save Extra 30%",
                              style: BalooStyles.baloomediumTextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
            },
          );
        }).toList(),
        // carouselController: buttonCarouselController,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: .55,
            aspectRatio: 1.5,
            initialPage: 2,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeStrategy: CenterPageEnlargeStrategy.zoom),
      ),
    );
  }
/*  _subscriptionCard({index=0}) {
    return GetBuilder<SubscriptionScreenController>(builder: (controller) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () {
              controller.selectedIndex = index;
              controller.selectedRupee = controller.rupeesList[index];
              controller.update();
            },
            child: Container(

              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
              margin: EdgeInsets.only(left: 15.sp, right: 10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: controller.selectedIndex == index ? 3 : 2,
                      color: controller.selectedIndex == index
                          ? Colors.lightGreenAccent
                          : Colors.black,

                  ),
                gradient: splashGradient2
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Image.asset("assets/membership.png",height: 35.sp,width: 35.sp,),


                  Text(
                    controller.montList[index],
                    style: BalooStyles.baloosemiBoldTextStyle(color: Colors.pink),
                    textAlign: TextAlign.center,
                  ).marginSymmetric(vertical:15),
                  Text(
                    controller.timeDuration[index],
                    style: BalooStyles.baloosemiBoldTextStyle(color: Colors.black87),
                    textAlign: TextAlign.center,
                  ).marginSymmetric(vertical: 15),
                  Text(
                    controller.rupeesList[index],
                    style: BalooStyles.baloosemiBoldTextStyle(size: 20,color: Colors.black),
                    textAlign: TextAlign.center,
                  ).marginSymmetric(vertical: 10),
                ],
              ),
            ),
          ),

          index == 0
              ? Positioned(
           left: 30.sp,
                top: -25,
                child: Container(
            padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: Colors.green),
            child: Text(
                "Save Extra 30%",
                style: BalooStyles.baloomediumTextStyle(),
                textAlign: TextAlign.center,
            ),
          ),
              )
              : Container(),
        ],
      );
    });
  }*/
}

class PurchaseHandler extends DefaultPurchaseHandler {
  @override
  Future<bool> purchase(SubscriptionData productDetails) async {
    print("purchase start");
    isPendingPurchase = true;
    await Future.delayed(const Duration(seconds: 1));
    print("purchase done");
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }

  @override
  Future<bool> restore() async {
    isPendingPurchase = true;
    await Future.delayed(const Duration(seconds: 1));
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }
}
