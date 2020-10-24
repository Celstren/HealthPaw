import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/banner.dart';

void onMessageMethod(message, context) {
  /// VERIFY VARIABLES
  String title = message['notification']['title'] ?? '';
  String body = message['notification']['body'] ?? '';

  /// VERIFY IF HAS CONTEXT
  if (context != null) {
    /// SHOWS BANNER
    BannerAlert.show(context,
        title: title,
        description: body,
        backgroundColor: AppColors.PrimaryOrange,
        gravity: BannerAlert.TOP, onTap: () {
      print(message);
    });
  }
}
