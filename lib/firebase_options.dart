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
    apiKey: 'AIzaSyBvMYw57DGmIeHt2hOsg1WRwN_xlUN0hS4',
    appId: '1:344675874217:web:a8987889e602cfc2c500b8',
    messagingSenderId: '344675874217',
    projectId: 'fruits-store-app-f5d8b',
    authDomain: 'fruits-store-app-f5d8b.firebaseapp.com',
    storageBucket: 'fruits-store-app-f5d8b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAE7jzvsH2aIN6T_6Y6Xc6xEGJm9-VZ-Aw',
    appId: '1:344675874217:android:03ca74d2683e6604c500b8',
    messagingSenderId: '344675874217',
    projectId: 'fruits-store-app-f5d8b',
    storageBucket: 'fruits-store-app-f5d8b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCk6-0LN_JZoxjT2uDQq2PPRzPX0AnO-uA',
    appId: '1:344675874217:ios:2ebaffc3c7997514c500b8',
    messagingSenderId: '344675874217',
    projectId: 'fruits-store-app-f5d8b',
    storageBucket: 'fruits-store-app-f5d8b.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCk6-0LN_JZoxjT2uDQq2PPRzPX0AnO-uA',
    appId: '1:344675874217:ios:2ebaffc3c7997514c500b8',
    messagingSenderId: '344675874217',
    projectId: 'fruits-store-app-f5d8b',
    storageBucket: 'fruits-store-app-f5d8b.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBvMYw57DGmIeHt2hOsg1WRwN_xlUN0hS4',
    appId: '1:344675874217:web:a8987889e602cfc2c500b8',
    messagingSenderId: '344675874217',
    projectId: 'fruits-store-app-f5d8b',
    authDomain: 'fruits-store-app-f5d8b.firebaseapp.com',
    storageBucket: 'fruits-store-app-f5d8b.firebasestorage.app',
  );

}