import 'package:flutter/material.dart';

class AppSettings {
  static const bool enableWebMaxWidth = false;
  static const bool enableAppBg = false;
  static const bool enableAppScrollbar = false;
  static const bool enableScaffoldBg =
      false; //! todo:  fix bg img change after toggling themeMode
  static const bool lockAppOrientation = false;
  static const bool enableDevicePreview = false;
  static const ScrollPhysics kAppScrollPhysics = BouncingScrollPhysics();
}
