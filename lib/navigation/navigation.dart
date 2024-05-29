/*
 * @copyright : Ozvid Technologies Pvt. Ltd. < www.ozvid.com >
 * @author     : Shiv Charan Panjeta < shiv@ozvid.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Ozvid Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:moto_park/main.dart';

abstract class AppRoutes {
  static const splash = '/splash';

  static const homeScreen = '/homeScreen';
  static const signUp = '/signUp';
  static const editProfile = '/editProfile';
  static const login = '/login';
  static const resetpass= '/reset';
  static const forgot = '/forgot';
  static const otpScreen = '/otpScreen';
  static const changePassword = '/changePassword';
  static const addVehicle = '/addVehicle';
  static const qrScreen = '/qrScreen';
  static const subscriptionScreen = '/subscriptionScreen';
  static const career = '/career';
  static const uploadDocument = '/uploadDocument';
  static const uploadDocumenth = '/uploadDocumenth';
  static const pdfScreen = '/pdfScreen';
  static const invoices = '/invoices';
  static const editChartOfAccount = '/editChartOfAccount';
  static const showVehicle = '/showVehicledata';
  static const notification = '/notification';
  static const QrCodeInform = '/QrCodeInform';
  static const deleteVehicle = '/deleteVehicle';
  // static const documentAndReminders = '/documentAndReminders';
  static const helpCenter = '/help';
}

class RoutesArgument {
  static const emailKey = "emailKey";
  static const userKey = "userKey";
}

class LoggerX {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => isError ? log.v("$text") : log.i("$text"));
  }
}
