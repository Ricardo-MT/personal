import 'package:flutter/foundation.dart';

class DeviceProvider extends ChangeNotifier {
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  DeviceProvider();
}
