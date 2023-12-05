import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import 'ui_helpers.dart';

class AppStyle {
  static SmoothBorderRadius buildBorderRadius({
    double? radius,
    double smoothing = 1,
    bool topLeft = true,
    bool topRight = true,
    bool bottomLeft = true,
    bool bottomRight = true,
  }) =>
      SmoothBorderRadius.only(
        topLeft: topLeft
            ? SmoothRadius(
                cornerRadius: radius ?? tinySize,
                cornerSmoothing: smoothing,
              )
            : SmoothRadius.zero,
        topRight: topRight
            ? SmoothRadius(
                cornerRadius: radius ?? tinySize,
                cornerSmoothing: smoothing,
              )
            : SmoothRadius.zero,
        bottomLeft: bottomLeft
            ? SmoothRadius(
                cornerRadius: radius ?? tinySize,
                cornerSmoothing: smoothing,
              )
            : SmoothRadius.zero,
        bottomRight: bottomRight
            ? SmoothRadius(
                cornerRadius: radius ?? tinySize,
                cornerSmoothing: smoothing,
              )
            : SmoothRadius.zero,
      );

  static const bottomPanelShape = SmoothRectangleBorder(
    borderRadius: SmoothBorderRadius.only(
        topLeft: SmoothRadius(cornerRadius: tinySize, cornerSmoothing: 1),
        topRight: SmoothRadius(cornerRadius: tinySize, cornerSmoothing: 1)),
  );

  static buildTextShadow({
    Offset? offset,
    double? blurRadius,
    Color? color,
    bool isLighterShadow = false,
  }) =>
      <Shadow>[
        Shadow(
          offset: offset ?? const Offset(1.0, 1.0),
          blurRadius: blurRadius ?? 2.0,
          color: color != null
              ? color
              : isLighterShadow
                  ? Colors.white54
                  : Colors.black54,
        ),
      ];

  static const noTextShadow = <Shadow>[
    Shadow(
      offset: Offset(0.0, 0.0),
      blurRadius: 0.0,
      color: Colors.transparent,
    ),
  ];
/* 
  static InputDecoration buildInputDecoration({
    required String hintText,
    TextStyle? hintTextStyle,
    Widget? leading,
    Widget? trailing,
    Function()? onTrailingTapped,
    bool hasBorder = true,
    bool isFilled = false,
    Color? fillColor,
    String? errorText,
    bool isFloatingLabel = true,
  }) {
    var circularBorder = OutlineInputBorder(
      borderRadius: buildBorderRadius(radius: Margin.small),
    );
    Color borderSideColor =
        Get.isDarkMode ? AppColor.inputBorderDark : AppColor.inputBorder;
    return InputDecoration(
      hintText: isFloatingLabel ? null : hintText,
      hintStyle: hintTextStyle ?? Get.textTheme.caption,
      labelText: isFloatingLabel ? hintText : null,
      labelStyle: hintTextStyle ?? Get.textTheme.bodyText2,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Margin.normal,
        horizontal: Margin.large,
      ),
      filled: isFilled,
      fillColor: (fillColor != null)
          ? fillColor
          : Get.isDarkMode
              ? AppColor.inputFilledDark
              : AppColor.inputFilled,
      prefixIcon: leading,
      suffixIcon: trailing,
      errorText: errorText,
      border: !hasBorder
          ? InputBorder.none
          : circularBorder.copyWith(
              borderSide: BorderSide(color: borderSideColor),
            ),
      errorBorder: !hasBorder
          ? InputBorder.none
          : circularBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.error),
            ),
      focusedBorder: !hasBorder
          ? InputBorder.none
          : circularBorder.copyWith(
              borderSide: BorderSide(color: borderSideColor),
            ),
      enabledBorder: !hasBorder
          ? InputBorder.none
          : circularBorder.copyWith(
              borderSide: BorderSide(color: borderSideColor),
            ),
    );
  } */
}
