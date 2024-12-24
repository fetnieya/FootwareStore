import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

FirebaseOptions firebaseOptions = Platform.isAndroid ?
    const FirebaseOptions(
    apiKey: 'AIzaSyA_WF3y1Sldo2D_sMwbBkZxr4Ko2JVCNHg',
    appId: '1:2273141739:android:2343c50c8c7d199d7f2fae',
    messagingSenderId: '2273141739',
    projectId: 'store-c2371')
    :const FirebaseOptions(
    apiKey: 'AIzaSyCL5HoenQ6PkqjqM9thzr59LMmM02n8yGs',
    appId: '1:2273141739:ios:d81bba8755da4a6e7f2fae',
    messagingSenderId: '2273141739',
    projectId: 'store-c2371');