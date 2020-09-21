import 'enum.dart';

class BuildEnvironment<String> extends Enum<String> {
  const BuildEnvironment(String val) : super(val);

  /// PROD
  static const PROD_API = const BuildEnvironment('');

  /// DEV
  static const DEV_API = const BuildEnvironment('http://localhost:3000/api/');

  /// LOCAL Android
  static const LOCAL_ANDROID =
      const BuildEnvironment('http://10.0.2.2:3000/api/');

  /// TESTING
  static const TEST_API =
      const BuildEnvironment('http://54.149.206.203:57320/api/');
}
