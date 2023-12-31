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
    apiKey: 'AIzaSyAmfcEOLbhLhggxTY9_M0kq5LQMnl7Clwk',
    appId: '1:594264069078:web:84bccd9438550d66400a77',
    messagingSenderId: '594264069078',
    projectId: 'stargopizza',
    authDomain: 'stargopizza.firebaseapp.com',
    storageBucket: 'stargopizza.appspot.com',
    measurementId: 'G-Q0D2YS50Q4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNCYbRzlm_ChMBdC5ft17J9HWoI6y0OL8',
    appId: '1:594264069078:android:5a458b9edd662c59400a77',
    messagingSenderId: '594264069078',
    projectId: 'stargopizza',
    storageBucket: 'stargopizza.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvsDifTLlpW8NsstHVNKsqD-OTX4XklD4',
    appId: '1:594264069078:ios:5bb9c09e87e6cd1a400a77',
    messagingSenderId: '594264069078',
    projectId: 'stargopizza',
    storageBucket: 'stargopizza.appspot.com',
    iosClientId: '594264069078-ge5k01uajqidj77d5p2l4qoiigkc5gha.apps.googleusercontent.com',
    iosBundleId: 'com.abdullah.user.pizza.star.go.user',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvsDifTLlpW8NsstHVNKsqD-OTX4XklD4',
    appId: '1:594264069078:ios:5bb9c09e87e6cd1a400a77',
    messagingSenderId: '594264069078',
    projectId: 'stargopizza',
    storageBucket: 'stargopizza.appspot.com',
    iosClientId: '594264069078-ge5k01uajqidj77d5p2l4qoiigkc5gha.apps.googleusercontent.com',
    iosBundleId: 'com.abdullah.user.pizza.star.go.user',
  );
}
