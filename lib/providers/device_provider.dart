import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceProvider extends ChangeNotifier {
  MuiDevice device = MuiDevice.mobile;
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  DeviceProvider() {
    deviceInfoPlugin.webBrowserInfo.then((value) {
      print(value.toMap());
    });
  }
}

enum MuiDevice { mobile, desktop }
