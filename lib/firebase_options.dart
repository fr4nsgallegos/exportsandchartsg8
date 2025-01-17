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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJW-KRgnAEapae3MFXs7no08uecvJ1Lk8',
    appId: '1:972910265079:android:f8836a0aceb9451a8c49f2',
    messagingSenderId: '972910265079',
    projectId: 'fir-app-1cc1c',
    storageBucket: 'fir-app-1cc1c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxJxrF2sAfzCju-y69dA9AkWx8JgBuY_U',
    appId: '1:972910265079:ios:c445b57dafa7629d8c49f2',
    messagingSenderId: '972910265079',
    projectId: 'fir-app-1cc1c',
    storageBucket: 'fir-app-1cc1c.appspot.com',
    androidClientId: '972910265079-iskbb8d4sugk0cr42uvh5r6t1sigmg7c.apps.googleusercontent.com',
    iosClientId: '972910265079-mca2vuj944r5a9l70vedgb0d48ccaa33.apps.googleusercontent.com',
    iosBundleId: 'pe.codigog8.exportsandchartsg8',
  );

}