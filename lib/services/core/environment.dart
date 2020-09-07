import 'enum.dart';

class BuildEnvironment<String> extends Enum<String> {
  const BuildEnvironment(String val) : super(val);

  /// PROD
  static const PROD_API =
      const BuildEnvironment('');

  /// DEV
  static const DEV_API =
      const BuildEnvironment('http://localhost:3000/api/');
}
