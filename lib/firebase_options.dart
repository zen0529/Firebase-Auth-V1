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
    apiKey: 'AIzaSyBmi6NrP5J1QIJXJfOQGpCbUu-mMmbUb84',
    appId: '1:1091683337871:web:247958119fd76de34a92fa',
    messagingSenderId: '1091683337871',
    projectId: 'fir-auth-v1-fceac',
    authDomain: 'fir-auth-v1-fceac.firebaseapp.com',
    storageBucket: 'fir-auth-v1-fceac.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAU6F2YhCP_zWGpKugLN9L1no4h5Q72dUI',
    appId: '1:1091683337871:android:d1a6216c5a99a3ac4a92fa',
    messagingSenderId: '1091683337871',
    projectId: 'fir-auth-v1-fceac',
    storageBucket: 'fir-auth-v1-fceac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYjuXxJzFtoRAtBZLGcRSbCE9cZC4ehys',
    appId: '1:1091683337871:ios:fce33f317139d3614a92fa',
    messagingSenderId: '1091683337871',
    projectId: 'fir-auth-v1-fceac',
    storageBucket: 'fir-auth-v1-fceac.appspot.com',
    iosBundleId: 'com.example.mobile3Midterm',
  );
}
