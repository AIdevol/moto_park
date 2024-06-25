// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCHqbkY5Zuco5rYD7feP7dBSZJByD_LTDE',
    appId: '1:37732685249:web:75210b8408144b295b8b40',
    messagingSenderId: '37732685249',
    projectId: 'motopark-45477',
    authDomain: 'motopark-45477.firebaseapp.com',
    storageBucket: 'motopark-45477.appspot.com',
    measurementId: 'G-N5RLYPJ75G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8W4bc16bzQBr4YXE99jicG1u3IMjLto0',
    appId: '1:37732685249:android:da3fd8a688630ca35b8b40',
    messagingSenderId: '37732685249',
    projectId: 'motopark-45477',
    storageBucket: 'motopark-45477.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3pnX3tMBv2U8u8B2XsRc_FXJ5dZzje0M',
    appId: '1:37732685249:ios:c4fb502c519c3c3f5b8b40',
    messagingSenderId: '37732685249',
    projectId: 'motopark-45477',
    storageBucket: 'motopark-45477.appspot.com',
    iosBundleId: 'com.example.testProPay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3pnX3tMBv2U8u8B2XsRc_FXJ5dZzje0M',
    appId: '1:37732685249:ios:c4fb502c519c3c3f5b8b40',
    messagingSenderId: '37732685249',
    projectId: 'motopark-45477',
    storageBucket: 'motopark-45477.appspot.com',
    iosBundleId: 'com.example.testProPay',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCHqbkY5Zuco5rYD7feP7dBSZJByD_LTDE',
    appId: '1:37732685249:web:098886bd250eb1f85b8b40',
    messagingSenderId: '37732685249',
    projectId: 'motopark-45477',
    authDomain: 'motopark-45477.firebaseapp.com',
    storageBucket: 'motopark-45477.appspot.com',
    measurementId: 'G-W0BKJ557VW',
  );
}