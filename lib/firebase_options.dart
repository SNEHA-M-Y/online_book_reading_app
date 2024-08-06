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
    apiKey: 'AIzaSyCj-UtCiKDqgQAHIfPq8AFz8ky6vYmTrSY',
    appId: '1:44158382221:web:9d6de37cf3143b17f032c4',
    messagingSenderId: '44158382221',
    projectId: 'online-book-reading-app-7382f',
    authDomain: 'online-book-reading-app-7382f.firebaseapp.com',
    storageBucket: 'online-book-reading-app-7382f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmqhSj4LdY7V3oDq6vSHcNYYxIRSVYU8c',
    appId: '1:44158382221:android:00d82ad13ca967c8f032c4',
    messagingSenderId: '44158382221',
    projectId: 'online-book-reading-app-7382f',
    storageBucket: 'online-book-reading-app-7382f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTA1TfCw3Eh-m-vlCqgiZuf7LYZL6GQa0',
    appId: '1:44158382221:ios:59574b643c66e11af032c4',
    messagingSenderId: '44158382221',
    projectId: 'online-book-reading-app-7382f',
    storageBucket: 'online-book-reading-app-7382f.appspot.com',
    iosBundleId: 'com.example.onlineBookReadingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTA1TfCw3Eh-m-vlCqgiZuf7LYZL6GQa0',
    appId: '1:44158382221:ios:59574b643c66e11af032c4',
    messagingSenderId: '44158382221',
    projectId: 'online-book-reading-app-7382f',
    storageBucket: 'online-book-reading-app-7382f.appspot.com',
    iosBundleId: 'com.example.onlineBookReadingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCj-UtCiKDqgQAHIfPq8AFz8ky6vYmTrSY',
    appId: '1:44158382221:web:09471369da934556f032c4',
    messagingSenderId: '44158382221',
    projectId: 'online-book-reading-app-7382f',
    authDomain: 'online-book-reading-app-7382f.firebaseapp.com',
    storageBucket: 'online-book-reading-app-7382f.appspot.com',
  );
}