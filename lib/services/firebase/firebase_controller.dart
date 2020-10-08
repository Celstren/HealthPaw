import 'dart:io';

import 'package:HealthPaw/services/firebase/methods.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseController {
  FirebaseController._();

  factory FirebaseController() => _instance;

  static final FirebaseController _instance = FirebaseController._();

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static bool _initialized = false;

  static Future<void> init(BuildContext context) async {
    if (!_initialized) {
      /// For iOS request permission first.
      if (Platform.isIOS) {
        _firebaseMessaging
            .requestNotificationPermissions(IosNotificationSettings());
      }

      _handler(context);

      saveFMCToken();
      _initialized = true;
    }
  }

  static void _handler(BuildContext context) {
    _firebaseMessaging.configure(
      ///METHOD ONCE IT'S ON FOREGROUND
      onMessage: (Map<String, dynamic> message) async {
        onMessageMethod(message, context);
        print("onMessage: $message");
      },

      ///METHOD RETURNS THE LAST MESSAGE ONCE LAUNCHED
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },

      ///METHOD RETURNS THE MESSAGE ONCE CLICKED ON NOTIFICATIONS
      onResume: (Map<String, dynamic> message) async {
        onResumeMethod(message);
        print("onMessage: $message");
      },
    );
  }

  static void saveFMCToken() async {
    String fmcToken = await _firebaseMessaging.getToken();
    /// For testing purposes print the Firebase Messaging token
    print("FirebaseMessaging token: $fmcToken");
  }
}
