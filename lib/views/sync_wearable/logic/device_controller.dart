import 'package:rxdart/rxdart.dart';

class DeviceController {
  static DeviceController _instance;

  static BehaviorSubject<bool> _isConnected = BehaviorSubject.seeded(false);
  static BehaviorSubject<String> _deviceId = BehaviorSubject();

  DeviceController._();

  factory DeviceController() => _getInstance();

  static DeviceController _getInstance() {
    if (_instance == null) {
      _instance = DeviceController._();
    }
    return _instance;
  }

  static Stream<bool> get isConnectedStream => _isConnected.stream;
  static bool get isConnectedValue => _isConnected.value;
  static set updatedIsConnected(bool data) => _isConnected.add(data);

  static Stream<String> get deviceIdStream => _deviceId.stream;
  static String get deviceIdValue => _deviceId.value;
  static set updatedDeviceId(String data) => _deviceId.add(data);

  static void init() {
    _isConnected = BehaviorSubject.seeded(false);
    _deviceId = BehaviorSubject();
  }

  static void dispose() {
    _isConnected.close();
    _deviceId.close();
  }
}