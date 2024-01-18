// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB0nOqssS4U59eSMRPKMY7LuWwAVfcLh-g',
    appId: '1:1038800197660:web:f1a5406061117018fb27d9',
    messagingSenderId: '1038800197660',
    projectId: 'dahar-project',
    authDomain: 'dahar-project.firebaseapp.com',
    storageBucket: 'dahar-project.appspot.com',
    measurementId: 'G-SJYLJKHHVE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgoUQH52eIbUzS1vYKXhZLKXW7WD1ZVLg',
    appId: '1:1038800197660:android:061c645e98d07764fb27d9',
    messagingSenderId: '1038800197660',
    projectId: 'dahar-project',
    storageBucket: 'dahar-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqb2B0MEI8Tnv2GHYzw_RqJG3c_vFWv8Q',
    appId: '1:1038800197660:ios:30759546d868afa2fb27d9',
    messagingSenderId: '1038800197660',
    projectId: 'dahar-project',
    storageBucket: 'dahar-project.appspot.com',
    iosBundleId: 'com.example.daharApp',
  );
}
