class DeviceController {
  static DeviceController _instance;
  static bool isConnected = false;
  static String deviceId;

  DeviceController._();

  factory DeviceController() => _getInstance();

  static DeviceController _getInstance() {
    if (_instance == null) {
      _instance = DeviceController._();
    }
    return _instance;
  }
}