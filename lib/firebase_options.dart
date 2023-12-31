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
    apiKey: 'AIzaSyCSF-Z2ZgyyzcYlpnnBtmx-LSAWoPS3Zz0',
    appId: '1:97763242488:web:b4dff58d561ba038bae60d',
    messagingSenderId: '97763242488',
    projectId: 'tugas1pemob',
    authDomain: 'tugas1pemob.firebaseapp.com',
    storageBucket: 'tugas1pemob.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAo8kluvRC3ERwpGXqGgpy4QWJDnNBa1Dc',
    appId: '1:97763242488:android:81bf8c6420255b3bbae60d',
    messagingSenderId: '97763242488',
    projectId: 'tugas1pemob',
    storageBucket: 'tugas1pemob.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvaxPBAffa9-Y8SC0gr224Ndn5Lus6mC0',
    appId: '1:97763242488:ios:0b7a998c03bcf206bae60d',
    messagingSenderId: '97763242488',
    projectId: 'tugas1pemob',
    storageBucket: 'tugas1pemob.appspot.com',
    iosClientId: '97763242488-49n0u0c9i4k7ejbhduo5a0igepppqg40.apps.googleusercontent.com',
    iosBundleId: 'com.example.main',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvaxPBAffa9-Y8SC0gr224Ndn5Lus6mC0',
    appId: '1:97763242488:ios:e4e4256ef2ec5e55bae60d',
    messagingSenderId: '97763242488',
    projectId: 'tugas1pemob',
    storageBucket: 'tugas1pemob.appspot.com',
    iosClientId: '97763242488-fnlu4s7uknl11pfl3gstrt054the80bi.apps.googleusercontent.com',
    iosBundleId: 'com.example.main.RunnerTests',
  );
}
