

import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> launchRateAppUrl(String appStoreId, String packageName) async {
  final String url = Platform.isIOS
      ? 'https://apps.apple.com/app/id$appStoreId' 
      : 'https://play.google.com/store/apps/details?id=$packageName';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
