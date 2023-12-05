import 'package:chatbot/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

Widget loading({
  bool center = true,
  double size = 80,
  bool hasPadding = true,
  double? padding,
}) {
  return Container(
    height: size,
    width: size,
    alignment: center ? Alignment.center : null,
    padding:
        hasPadding ? EdgeInsets.all(padding ?? tinySize) : EdgeInsets.zero,
    child: const CircularProgressIndicator(),
  );
}
