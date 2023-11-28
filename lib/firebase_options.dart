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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAb1R7TNYMI_zbjsbtQM8rDqreR2-vQnW4',
    appId: '1:85657059048:web:e4b9c896354a7307e1935d',
    messagingSenderId: '85657059048',
    projectId: 'fir-storage-50662',
    authDomain: 'fir-storage-50662.firebaseapp.com',
    storageBucket: 'fir-storage-50662.appspot.com',
    measurementId: 'G-SP8VMJ6QS3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtMk3Hd6nwTbvel3e4R92P04ZNOhWSOBo',
    appId: '1:85657059048:android:13792aa9553ad289e1935d',
    messagingSenderId: '85657059048',
    projectId: 'fir-storage-50662',
    storageBucket: 'fir-storage-50662.appspot.com',
  );
}