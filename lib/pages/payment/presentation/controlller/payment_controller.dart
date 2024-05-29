import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/utilities/custom_flashbar.dart';

class PaymentController extends GetxController{
  // key_id,key_secret
  // rzp_test_2P38XNePtDYveW,1PolTEVNz9N0rQgDhFDLiMqk

  late Razorpay razorpay;

  @override
  void onInit() {
    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Get.toNamed(AppRoutes.homeScreen,arguments: {
      "orderid": response.orderId,
      "paymentId": response.paymentId,
      "signature": response.signature,
    });
    toast("Payment Successful");

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    toast("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }



  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }

}