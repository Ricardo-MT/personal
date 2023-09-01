import 'package:flutter/material.dart';

bool shouldDisableAllowScrolling(
    BuildContext context, TargetPlatform platform) {
  return platform == TargetPlatform.linux ||
      platform == TargetPlatform.macOS ||
      platform == TargetPlatform.windows;
}
