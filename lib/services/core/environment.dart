import 'enum.dart';

class BuildEnvironment<String> extends Enum<String> {
  const BuildEnvironment(String val) : super(val);

  /// PROD
  static const PROD_API = const BuildEnvironment('');

  /// DEV
  static const DEV_API = const BuildEnvironment('http://localhost:3000/api/');

  /// LOCAL Android
  static const LOCAL_ANDROID =
      const BuildEnvironment('http://192.168.1.7:3000/api/');


  /// TESTING
  static const TEST_API =
      const BuildEnvironment('http://192.168.0.8:3000/api/');
}

// test@abc.com
