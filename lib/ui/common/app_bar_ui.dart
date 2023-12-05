import 'package:chatbot/ui/common/color.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

import 'button_ui.dart';

// ignore: non_constant_identifier_names
AppBar AppBarUi({
  required Widget title,
  //Widget leading,
  int maxLines = 1,
  double elevation = 1.0,
  bool centerTitle = false,
  String? image,
  Color? textColor,
  Color? backgroundColor,
  bool showNotificationBtn = false,
  bool showTitleShadow = false,
  List<Widget>? actions,
  PreferredSizeWidget? bottomWidget,
}) {
  return AppBar(
    title: title,
    /* title: !isBlankString(image)
        ? Image.asset(
            image!,
            fit: BoxFit.contain,
            height: AppDimen.appBarIconSize,
          )
        : AutoSizeText(
            title!,
            maxLines: 2,
            textScaleFactor: 1.1,
            style: Get.textTheme.subtitle1!.copyWith(
              color: textColor,
              wordSpacing: 1.1,
              letterSpacing: 0.9,
              shadows: showTitleShadow
                  ? AppStyle.buildTextShadow(
                      blurRadius: 0.5,
                      color: Get.theme.primaryColor.withOpacity(.2))
                  : null,
            ),
          ), */
    centerTitle: centerTitle,
    backgroundColor: backgroundColor,
    /*iconTheme: IconThemeData(
      color: Get.theme.primaryColor,
    ),
     actionsIconTheme: IconThemeData(
      color: Get.theme.primaryColor,
    ), */
    primary: true,
    elevation: elevation,
    automaticallyImplyLeading: true,
    actions: [
      if (showNotificationBtn)
        ButtonUi.only(
          leading: const Icon(
            Icons.notifications,
            color: AppColor.canvas,
          ),
          onPressed: () {
            //Get.toNamed(RouteHelper.notification);
          },
          text: 'Notification',
        ),
      /* if (foundation.kDebugMode)
        ButtonUi.only(
          leading: Icon(
            Icons.light_mode,
            color: AppColor.canvas,
          ),
          onPressed: () {
            ThemeController.to.toggleTheme();
          },
          tooltip: '[DEBUG] Toggle Theme',
        ), */
      ...actions ?? [],
    ],
    bottom: bottomWidget,
  );
}
