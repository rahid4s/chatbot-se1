import 'package:flutter/material.dart';

class AppDimen {
  /// [kAppDesignSpec] used for translating design specs to UI elements and dimens
  /// For reference:
  /// iPhone 6 = 750, 1334
  /// iPhone X = 1125, 2436
  static const Size appDesignSpec = Size(750, 1334);
  static const double appBarHeight = kToolbarHeight;
  static const double appBarIconSize = kToolbarHeight * .7;
  static const double appBarBottomHeight = 60;
  static const double fullScreenBottomSheetHeightPercentage = .9;
  static const double minFontSize = 7;

  /// [kMinWidthForScrollScreen] used to determine if screen should enable scrollbars
  static const double minWidthForScrollBarScreen = 359.0;
  static const double minHeightForScrollBarScreen = 359.0;
}
