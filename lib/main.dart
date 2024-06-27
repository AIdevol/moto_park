import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:moto_park/navigation/app_pages.dart';
import 'package:moto_park/navigation/init_binding.dart';
import 'package:moto_park/navigation/navigation.dart';
import 'package:moto_park/pages/Authentication/presentation/views/login_screen.dart';
import 'package:moto_park/pages/Notification/notification_cotroller.dart';
import 'package:moto_park/pages/Notification/notifications_api.dart';
import 'package:moto_park/response_model/register_response_model.dart';
import 'package:moto_park/utilities/custom_loader.dart';

import 'firebase_options.dart';

var log = Logger();
bool isVerifyContact1 = false;
bool isVerifyContact2 = false;
bool isVerifyContact3 = false;



GetStorage storage = GetStorage();
CustomLoader customLoader = CustomLoader();

Future<void> _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("you have recieved a notificaiton: ${message.notification!.title}");
  }
}

Future<void> main() async {
  // await FirebaseMessaging.instance.requestPermission();
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(NotificationController());
  await PushNotifications.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Account',
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
          ),
          builder: EasyLoading.init(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          // scrollBehavior: AppScrollBehavior(),
          initialBinding: InitBinding(),
          debugShowCheckedModeBanner: false,
          logWriterCallback: LoggerX.write,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.black,
            ),
          ),
          defaultTransition: Transition.cupertino,
          home: child,
        );
      },
      // child:  MainScreen(),
    );
  }
}
