import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moto_park/constants/local_keys.dart';
import 'package:moto_park/pages/Authentication/presentation/views/subscription_screen.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

import '../../../../main.dart';
// import '../../../../response_model/subscription_data_model.dart';
import '../../../../response_model/subscription_data_model.dart';
import '../../../../services/APIs/auth_service/auth_api_service.dart';

class SubscriptionScreenController extends GetxController{
  List<String> timeDuration = [ "1 Year\nSubscription", "6 Month\nSubscription" ,"1 Month\nSubscription",];
  List<SubscCardModel> rupeesList = [];
  int selectedIndex = 0;
  List<String> montList= ["Yearly","Quarterly","Monthly"];
  // "₹370 /month", "₹400 /month" ,"₹500 /month",ac
  var selectedRupee = "";
  PurchaseHandler purchaseHandler = PurchaseHandler();
  SubscCardModel cardModel =SubscCardModel(months: '', rupees: '', timed: '');
 // var UserName = SubscCardModel().name;
 // var TenureDuration = SubscCardModel().tenure;

  @override
  void onInit() {
    // TODO: implement onInit
    rupeesList.add(SubscCardModel(months:"Yearly",rupees:"₹500 /year",timed: "1 year Subscription" ,name: "Yearly Subscription", tenure: 12 ));
    rupeesList.add(SubscCardModel(months:"Quarterly",rupees:"₹400 /month",timed: "6 month Subscription",name: "Quarterly Subscription", tenure: 6  ));
    rupeesList.add(SubscCardModel(months:"Monthly",rupees:"₹370 /month",timed: "1 month Subscription" ,name:"Monthly Subscription",tenure: 1 ));

    super.onInit();
  }

  Future<SubscCardModel?> hitsubsubscriptionApicall() async {
    customLoader.show();
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      SubscCardModel subscription = rupeesList[selectedIndex];
      Map<String, dynamic> dataBody = {
        'name': subscription.name,
        'tenure': subscription.tenure,
      };
      SubscCardModel result = await Get.find<AuthenticationApiService>().addsubscriptionApicall(dataBody: dataBody);
      return result;
    } catch (e) {
      toast("An error occurred: ${e.toString()}");
      return null;
    } finally {
      customLoader.hide();
    }
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:moto_park/constants/local_keys.dart';
// import 'package:moto_park/pages/Authentication/presentation/views/subscription_screen.dart';
// import 'package:moto_park/utilities/custom_flashbar.dart';
// import '../../../../main.dart';
// // import '../../../../response_model/subscription_data_model.dart';
// import '../../../../navigation/navigation.dart';
// import '../../../../services/APIs/auth_service/auth_api_service.dart';
//
// class SubscriptionScreenController extends GetxController {
//   List<String> timeDuration = ["1 Year\nSubscription", "6 Month\nSubscription", "1 Month\nSubscription"];
//   List<SubscCardModel> rupeesList = [];
//   int selectedIndex = 0;
//   List<String> montList = ["Yearly", "Quarterly", "Monthly"];
//   var selectedRupee = "";
//   PurchaseHandler purchaseHandler = PurchaseHandler();
//   SubscCardModel cardModel = SubscCardModel();
//
//   late Razorpay _razorpay;
//
//   @override
//   void onInit() {
//     super.onInit();
//     rupeesList.add(SubscCardModel(months: "Yearly", rupees: "₹500 /month", timed: "1 year Subscription"));
//     rupeesList.add(SubscCardModel(months: "Quarterly", rupees: "₹400 /month", timed: "6 month Subscription"));
//     rupeesList.add(SubscCardModel(months: "Monthly", rupees: "₹370 /month", timed: "1 month Subscription"));
//
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   void openCheckout() {
//     var amount = selectedIndex == 0 ? 50000 : selectedIndex == 1 ? 40000 : 37000; // Amount in paise
//     var options = {
//       'key': 'rzp_test_2P38XNePtDYveW',
//       'amount': amount,
//       'name': 'Moto-Park',
//       'description': 'Subscription Plan',
//       'prefill': {'contact': '6388802100', 'email': 'devesh@weboappdiscovery.com'},
//       'currency': 'INR',
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     storage.write(isSubscribed, true);
//     Get.offAllNamed(AppRoutes.homeScreen);
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     toast("Payment failed: ${response.message}");
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     toast("External wallet selected: ${response.walletName}");
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }
//
//   Future<String?> hitsubsubscriptionApicall() async {
//     customLoader.show();
//     FocusManager.instance.primaryFocus?.unfocus();
//     try {
//       SubscCardModel subscription = await Get.find<AuthenticationApiService>().addsubscriptionApicall();
//       return subscription.rupees;
//     } catch (e) {
//       toast("An error occurred: ${e.toString()}");
//       return null;
//     } finally {
//       customLoader.hide();
//     }
//   }
// }
//
// class SubscCardModel {
//   String? timed;
//   String? rupees;
//   String? months;
//
//   SubscCardModel({this.months, this.rupees, this.timed});
// }
