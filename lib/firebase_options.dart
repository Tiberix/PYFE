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
    apiKey: 'AIzaSyDUANjjHwYVyfuOitS4r1XO8fDZ8X82vIc',
    appId: '1:977855539786:web:717620e53f6a97f9d5d4b3',
    messagingSenderId: '977855539786',
    projectId: 'chatting-edbd7',
    authDomain: 'chatting-edbd7.firebaseapp.com',
    storageBucket: 'chatting-edbd7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8AJBRE5YO29hW75xGMgjM5xSjzZLa_nY',
    appId: '1:977855539786:android:1f52791793687775d5d4b3',
    messagingSenderId: '977855539786',
    projectId: 'chatting-edbd7',
    storageBucket: 'chatting-edbd7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAV0IIxu2JuUZGZZvXfuOVk1ST4b5C2rVY',
    appId: '1:977855539786:ios:6e059bdf7c667105d5d4b3',
    messagingSenderId: '977855539786',
    projectId: 'chatting-edbd7',
    storageBucket: 'chatting-edbd7.appspot.com',
    androidClientId: '977855539786-281e3mmqo1t9ju262ct89s6c0sdbl9qn.apps.googleusercontent.com',
    iosClientId: '977855539786-kipiucackkqe8durutt4idcqlgatrjt1.apps.googleusercontent.com',
    iosBundleId: 'com.example.pyfe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAV0IIxu2JuUZGZZvXfuOVk1ST4b5C2rVY',
    appId: '1:977855539786:ios:6e059bdf7c667105d5d4b3',
    messagingSenderId: '977855539786',
    projectId: 'chatting-edbd7',
    storageBucket: 'chatting-edbd7.appspot.com',
    androidClientId: '977855539786-281e3mmqo1t9ju262ct89s6c0sdbl9qn.apps.googleusercontent.com',
    iosClientId: '977855539786-kipiucackkqe8durutt4idcqlgatrjt1.apps.googleusercontent.com',
    iosBundleId: 'com.example.pyfe',
  );
}
