import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moto_park/pages/Authentication/presentation/views/subscription_screen.dart';

import '../../../../main.dart';
import '../../../../services/APIs/auth_service/auth_api_service.dart';

class SubscriptionScreenController extends GetxController{
  List<String> timeDuration = [ "1 Year\nSubscription", "6 Month\nSubscription" ,"1 Month\nSubscription",];
  List<SubscCardModel> rupeesList = [];
  int selectedIndex = 0;
  List<String> montList= ["Yearly","Quarterly","Monthly"];
  // "₹370 /month", "₹400 /month" ,"₹500 /month",
  var selectedRupee = "";
  PurchaseHandler purchaseHandler = PurchaseHandler();
  SubscCardModel cardModel =SubscCardModel();

  @override
  void onInit() {
    // TODO: implement onInit
    rupeesList.add(SubscCardModel(months:"Yearly",rupees:"₹500 /month",timed: "1 year Subscription"  ));
    rupeesList.add(SubscCardModel(months:"Quarterly",rupees:"₹400 /month",timed: "6 month Subscription"  ));
    rupeesList.add(SubscCardModel(months:"Monthly",rupees:"₹370 /month",timed: "1 month Subscription"  ));

    super.onInit();
  }

/*hitsubsubscriptionApicall()async{
customLoader.show();
    FocusManager.instance.primaryFocus?.unfocus();
Get.find<AuthenticationApiService>()
    .getVehicledetailsApicall()
 }*/



}

class SubscCardModel{
String? timed;
String? rupees;
String? months;

SubscCardModel({this.months,this.rupees,this.timed});

}