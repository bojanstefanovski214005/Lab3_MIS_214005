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
    apiKey: 'AIzaSyCQRb9epwySaLtdmSuUQy2XT3o0PdGTujc',
    appId: '1:438863772334:web:30b5fbe336969a43918b3f',
    messagingSenderId: '438863772334',
    projectId: 'jokeapp-3a58c',
    authDomain: 'jokeapp-3a58c.firebaseapp.com',
    storageBucket: 'jokeapp-3a58c.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxpksAlTEm_bwA39oWwIyFjQgeHVsqyQM',
    appId: '1:438863772334:android:2d3f6474d2fb69e0918b3f',
    messagingSenderId: '438863772334',
    projectId: 'jokeapp-3a58c',
    storageBucket: 'jokeapp-3a58c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgo-n9M0G6yeF6NRtpDI3iRj3Drcccjwc',
    appId: '1:438863772334:ios:32573c25f009c04e918b3f',
    messagingSenderId: '438863772334',
    projectId: 'jokeapp-3a58c',
    storageBucket: 'jokeapp-3a58c.firebasestorage.app',
    iosBundleId: 'com.example.lab2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgo-n9M0G6yeF6NRtpDI3iRj3Drcccjwc',
    appId: '1:438863772334:ios:32573c25f009c04e918b3f',
    messagingSenderId: '438863772334',
    projectId: 'jokeapp-3a58c',
    storageBucket: 'jokeapp-3a58c.firebasestorage.app',
    iosBundleId: 'com.example.lab2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQRb9epwySaLtdmSuUQy2XT3o0PdGTujc',
    appId: '1:438863772334:web:f66c83ffd148b5a1918b3f',
    messagingSenderId: '438863772334',
    projectId: 'jokeapp-3a58c',
    authDomain: 'jokeapp-3a58c.firebaseapp.com',
    storageBucket: 'jokeapp-3a58c.firebasestorage.app',
  );
}
