import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
        iosBundleId: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:861912799257:android:25f85bf3051bac8302b288',
        apiKey: 'AIzaSyC4H8RppnTxde_yWStA72OzBQGsfJuGq94',
        projectId: 'sasta-mart-54b68',
        messagingSenderId: '861912799257',
      );
    }
  }}