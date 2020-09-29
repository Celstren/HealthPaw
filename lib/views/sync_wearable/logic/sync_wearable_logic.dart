import 'package:flutter/services.dart';

import 'device_controller.dart';

class SyncWearableLogic {
  static const platform =
      const MethodChannel('com.example.HealthPaw/mbientlab');
  bool expanded = false;

  static Future<bool> connectBoard(String id) async {
    try {
      bool value = await platform.invokeMethod(
          'connectBoard', {"boardId": id});
      DeviceController.updatedIsConnected = value;
      if (value) {
        DeviceController.updatedDeviceId = id;
      }
      return value;
    } on PlatformException catch (e) {
      print("Fail to connect: $e");
    }
    return false;
  }

  static Future<bool> disconnectBoard() async {
    try {
      bool success = await platform.invokeMethod('disconnectBoard');
      if (success) {
        DeviceController.updatedIsConnected = false;
        DeviceController.updatedDeviceId = null;
        return true;
      }
    } on PlatformException catch (e) {
      print("Fail to connect: $e");
    }
    return false;
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