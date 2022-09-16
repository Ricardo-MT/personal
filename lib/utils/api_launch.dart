import 'package:url_launcher/url_launcher.dart';

class ApiLaunch {
  static Future<void> launch(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
