import 'package:flutter/services.dart';

import 'device_controller.dart';

class SyncWearableLogic {
  static const platform =
      const MethodChannel('com.example.HealthPaw/mbientlab');
  bool expanded = false;

  static Future<void> connectBoard(String id) async {
    try {
      await platform.invokeMethod(
          'connectBoard', {"boardId": id});
      DeviceController.deviceId = id;
    } on PlatformException catch (e) {
      print("Fail to connect: $e");
    }
  }

  static Future<void> disconnectBoard() async {
    try {
      await platform.invokeMethod('disconnectBoard');
      DeviceController.isConnected = false;
      DeviceController.deviceId = null;
    } on PlatformException catch (e) {
      print("Fail to connect: $e");
    }
  }

  static Future<void> turnOffLed() async {
    try {
      await platform.invokeMethod('turnOffLed');
    } on PlatformException catch (e) {
      print("Fail to turn off: $e");
    }
  }

  static Future<void> turnOnLed() async {
    try {
      await platform.invokeMethod('turnOnLed', {"colorId": 0});
    } on PlatformException catch (e) {
      print("Fail to turn on: $e");
    }
  }

  static Future<void> activateLogs() async {
    try {
      await platform.invokeMethod('activateLogs');
    } on PlatformException catch (e) {
      print("Fail to activate logs: $e");
    }
  }

  static Future deactivateLogs() async {
    try {
      return await platform.invokeMethod('deactivateLogs');
    } on PlatformException catch (e) {
      print("Fail to deactivate logs: $e");
    }
    return null;
  }
}