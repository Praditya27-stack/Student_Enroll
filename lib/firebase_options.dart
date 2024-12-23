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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB1xRtj751ipC73VIaJV-hmVHVLqJh9LOs',
    appId: '1:566947526737:web:530d9637627df5788ba070',
    messagingSenderId: '566947526737',
    projectId: 'wmpfinal-573d2',
    authDomain: 'wmpfinal-573d2.firebaseapp.com',
    storageBucket: 'wmpfinal-573d2.firebasestorage.app',
    measurementId: 'G-P007KPFC7S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUgQlPZRTYiboR36WRIh88AKUNrhc7SAg',
    appId: '1:566947526737:android:8100a254f0ef89328ba070',
    messagingSenderId: '566947526737',
    projectId: 'wmpfinal-573d2',
    storageBucket: 'wmpfinal-573d2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqPgcrC0zPFl9oLpGR0zslHM1mMvIqN5c',
    appId: '1:566947526737:ios:1e93fa8bd391d3058ba070',
    messagingSenderId: '566947526737',
    projectId: 'wmpfinal-573d2',
    storageBucket: 'wmpfinal-573d2.firebasestorage.app',
    iosBundleId: 'com.example.studentenrollment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqPgcrC0zPFl9oLpGR0zslHM1mMvIqN5c',
    appId: '1:566947526737:ios:1e93fa8bd391d3058ba070',
    messagingSenderId: '566947526737',
    projectId: 'wmpfinal-573d2',
    storageBucket: 'wmpfinal-573d2.firebasestorage.app',
    iosBundleId: 'com.example.studentenrollment',
  );
}
