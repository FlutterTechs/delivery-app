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
    apiKey: 'AIzaSyDyCqf87k1Rhuc8UkSX8jQgE2XrWK6Lie8',
    appId: '1:1036625674533:web:96015d5f2de6c198b81acc',
    messagingSenderId: '1036625674533',
    projectId: 'ecommerce-a5bdd',
    authDomain: 'ecommerce-a5bdd.firebaseapp.com',
    storageBucket: 'ecommerce-a5bdd.appspot.com',
    measurementId: 'G-7FRD6DJF75',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaXURpAxANFwe6HWKNCr5pYD6hssDNrIw',
    appId: '1:1036625674533:android:2a87a7f10b1fe872b81acc',
    messagingSenderId: '1036625674533',
    projectId: 'ecommerce-a5bdd',
    storageBucket: 'ecommerce-a5bdd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1J_edHOK4p2FDMhZQj4wKusT1lbK5Sr4',
    appId: '1:1036625674533:ios:e96fb3f1e2419635b81acc',
    messagingSenderId: '1036625674533',
    projectId: 'ecommerce-a5bdd',
    storageBucket: 'ecommerce-a5bdd.appspot.com',
    iosBundleId: 'com.example.deliverymaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA1J_edHOK4p2FDMhZQj4wKusT1lbK5Sr4',
    appId: '1:1036625674533:ios:c4978a9102bf2e12b81acc',
    messagingSenderId: '1036625674533',
    projectId: 'ecommerce-a5bdd',
    storageBucket: 'ecommerce-a5bdd.appspot.com',
    iosBundleId: 'com.example.deliverymaster.RunnerTests',
  );
}
