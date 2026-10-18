import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web is not configured.');
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'Firebase is not configured for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4iOaDfDU_Yqvqws40zokoX_cw5Xx1EvA',
    appId: '1:87544092610:android:d5c455ae9981ba4009a85b',
    messagingSenderId: '87544092610',
    projectId: 'kaajlagbe-90e93',
    storageBucket: 'kaajlagbe-90e93.firebasestorage.app',
  );
}
