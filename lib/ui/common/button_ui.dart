// ignore_for_file: avoid_init_to_null, curly_braces_in_flow_control_structures

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatbot/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import '../../app/enum/button_type.dart';
import '../../app/util/string_list_helper.dart';
import 'color.dart';
import 'dimension.dart';
import 'loading_indicator.dart';
import 'style.dart';

class ButtonUi extends StatelessWidget {
  final String? text;
  final String? tooltip;
  final bool disabled;
  final bool isLoading;
  final bool isCircle;
  final double? textSize;
  final double elevation;
  final double? radius;
  final Function()? onPressed;
  final ButtonType buttonType;
  final int maxLine;
  final Widget? leading;
  final Color? color;
  final Color? textColor;
  final Color? loadingColor;
  final double? padding;
  final bool expandedText;

  const ButtonUi({
    Key? key,
    this.text,
    this.tooltip,
    this.disabled = false,
    this.isLoading = false,
    this.isCircle = false,
    this.textSize,
    this.elevation = 1,
    this.radius,
    this.onPressed,
    this.maxLine = 1,
    this.leading,
    this.color,
    this.textColor,
    this.loadingColor,
    this.padding,
    this.expandedText = false,
  })  : buttonType = ButtonType.basic,
        assert(leading != null || (text != null && text != ''),
            'At least one of title or leading has to be provided'),
        super(key: key);

  const ButtonUi.outline({
    Key? key,
    this.text,
    this.tooltip,
    this.disabled = false,
    this.isLoading = false,
    this.isCircle = false,
    this.textSize,
    this.elevation = 0,
    this.radius,
    this.onPressed,
    this.maxLine = 1,
    this.leading,
    this.color,
    this.textColor,
    this.loadingColor,
    this.padding,
    this.expandedText = false,
  })  : buttonType = ButtonType.outline,
        assert(leading != null || (text != null && text != ''),
            'At least one of text or leading has to be provided'),
        super(key: key);

  const ButtonUi.only({
    Key? key,
    this.text,
    this.tooltip,
    this.disabled = false,
    this.isLoading = false,
    this.isCircle = false,
    this.textSize,
    this.elevation = 0,
    this.radius,
    this.onPressed,
    this.maxLine = 1,
    this.leading,
    this.color,
    this.textColor,
    this.loadingColor,
    this.padding,
    this.expandedText = false,
  })  : buttonType = ButtonType.only,
        assert(leading != null || (text != null && text != ''),
            'At least one of text or leading has to be provided'),
        super(key: key);

  Color? _getBgColor() {
    if (buttonType == ButtonType.basic) {
      return _getColor();
    } else if (buttonType == ButtonType.outline) {
      return AppColor.transparent;
    } else {
      return AppColor.transparent;
    }
  }

  Color? _getTextColor() {
    if (disabled) {
      return AppColor.caption;
    } else if (buttonType == ButtonType.basic) {
      return textColor ?? AppColor.textPrimary;
    } else if (buttonType == ButtonType.outline) {
      return textColor ?? color ?? AppColor.primary;
    } else {
      return textColor ?? color ?? AppColor.accent;
    }
  }

  Color _getColor() {
    return disabled ? AppColor.caption : color ?? AppColor.primary;
  }

  @override
  Widget build(BuildContext context) {
    double btnPadding = padding == null
        ? tinySize
        : padding! <= 0
            ? 0
            : padding!;

    Widget? textWidget = null;
    if (!isBlankString(text)) {
      textWidget = AutoSizeText(
        text!,
        maxLines: maxLine,
        minFontSize: AppDimen.minFontSize,
        overflow: TextOverflow.fade,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: textSize,
              letterSpacing: 0.9,
              color: _getTextColor(),
            ),
      );

      textWidget = expandedText
          ? Expanded(child: textWidget)
          : Flexible(child: textWidget);
    }

    Widget child = Material(
      type: MaterialType.card,
      borderRadius:
          isCircle ? null : AppStyle.buildBorderRadius(radius: radius),
      shape: isCircle ? const CircleBorder() : null,
      clipBehavior: Clip.hardEdge,
      color: _getBgColor(),
      elevation: elevation,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            alignment: Alignment.center,
            decoration: buttonType == ButtonType.outline
                ? BoxDecoration(
                    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius: isCircle
                        ? null
                        : AppStyle.buildBorderRadius(radius: radius),
                    border: Border.all(
                      color: _getColor(),
                      width: 2,
                    ))
                : null,
            padding: EdgeInsets.all(btnPadding),
            child: !isLoading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leading != null) FittedBox(child: leading!),
                      if (leading != null && !isBlankString(text))
                        horizontalSpaceSmall,
                      if (!isBlankString(text)) textWidget!,
                    ],
                  )
                : FittedBox(
                    child: loading(
                      hasPadding: false,
                      //size: width ?? height,
                    ),
                  )),
      ),
    );
    if (!isBlankString(tooltip))
      child = Tooltip(
        message: tooltip,
        child: child,
      );
    return child;
  }
}

/* class ButtonUi extends StatelessWidget {
  final String? text;
  final bool disabled;
  final bool isLoading;
  final bool isCircle;
  final double? textSize;
  final double? width;
  final double? height;
  final double elevation;
  final double? radius;
  final Function()? onPressed;
  final String buttonType;
  final int maxLine;
  final Widget? leading;
  final Color? color;
  final Color? textColor;
  final Color? loadingColor;
  final double? padding;
  final bool expandedText;

  const ButtonUi({
    Key? key,
    this.text,
    this.disabled = false,
    this.isLoading = false,
    this.isCircle = false,
    this.textSize,
    this.width,
    this.height,
    this.elevation = 1,
    this.radius,
    this.onPressed,
    this.maxLine = 1,
    this.leading,
    this.color,
    this.textColor,
    this.loadingColor,
    this.padding,
    this.expandedText = false,
  })  : buttonType = "basic",
        assert(leading != null || (text != null && text != ''),
            'At least one of title or leading has to be provided'),
        super(key: key);

  const ButtonUi.outline({
    Key? key,
    this.text,
    this.disabled = false,
    this.isLoading = false,
    this.isCircle = false,
    this.textSize,
    this.width,
    this.height,
    this.elevation = 0,
    this.radius,
    this.onPressed,
    this.maxLine = 1,
    this.leading,
    this.color,
    this.textColor,
    this.loadingColor,
    this.padding,
    this.expandedText = false,
  })  : buttonType = "outline",
        assert(leading != null || (text != null && text != ''),
            'At least one of text or leading has to be provided'),
        super(key: key);

  const ButtonUi.text({
    Key? key,
    this.text,
    this.disabled = false,
    this.isLoading = false,
    this.isCircle = false,
    this.textSize,
    this.width,
    this.height,
    this.elevation = 0,
    this.radius,
    this.onPressed,
    this.maxLine = 1,
    this.leading,
    this.color,
    this.textColor,
    this.loadingColor,
    this.padding,
    this.expandedText = false,
  })  : buttonType = "text",
        assert(leading != null || (text != null && text != ''),
            'At least one of text or leading has to be provided'),
        super(key: key);

  Color? _getBgColor({required BuildContext context}) {
    if (buttonType == "basic") {
      return _getColor(context: context);
    } else if (buttonType == "outline") {
      return AppColor.transparent;
    } else {
      return AppColor.transparent;
    }
  }

  Color? _getTextColor({required BuildContext context}) {
    if (disabled) {
      return context.theme.hintColor;
    } else if (buttonType == "basic") {
      return textColor ?? context.theme.primaryTextTheme.subtitle1!.color;
    } else if (buttonType == "outline") {
      return textColor ?? color ?? context.theme.primaryColor;
    } else {
      return textColor ?? color ?? context.theme.colorScheme.secondary;
    }
  }

  Color _getColor({required BuildContext context}) {
    return disabled
        ? context.theme.hintColor
        : color ?? context.theme.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    double btnPadding = padding == null
        ? Margin.normal
        : padding! <= 0
            ? 0
            : padding!;

    double? btnInnerHeight = null;
    if (height != null && height! > btnPadding * 2)
      btnInnerHeight =
          (height! - btnPadding * 2) <= 0 ? null : (height! - btnPadding * 2);

    double? btnInnerWidth = null;
    if (width != null && width! > btnPadding * 2)
      btnInnerWidth =
          (width! - btnPadding * 2) <= 0 ? null : (width! - btnPadding * 2);

    Widget? textWidget = null;
    if (!isBlankString(text)) {
      textWidget = AutoSizeText(
        text!,
        maxLines: maxLine,
        minFontSize: AppDimen.minFontSize,
        overflow: TextOverflow.fade,
        style: context.textTheme.button!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: textSize,
          letterSpacing: 0.9,
          color: _getTextColor(context: context),
        ),
      );

      textWidget = expandedText
          ? Expanded(child: textWidget)
          : Flexible(child: textWidget);
    }

    Widget child = Material(
      type: MaterialType.card,
      borderRadius:
          isCircle ? null : AppStyle.buildBorderRadius(radius: radius),
      shape: isCircle ? const CircleBorder() : null,
      clipBehavior: Clip.hardEdge,
      color: _getBgColor(context: context),
      elevation: elevation,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            alignment: Alignment.center,
            decoration: buttonType == "outline"
                ? BoxDecoration(
                    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius: isCircle
                        ? null
                        : AppStyle.buildBorderRadius(radius: radius),
                    border: Border.all(
                      color: _getColor(context: context),
                      width: 2,
                    ))
                : null,
            padding: EdgeInsets.all(btnPadding),
            child: SizedBox(
              height: btnInnerHeight,
              width: btnInnerWidth,
              child: !isLoading
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (leading != null) FittedBox(child: leading!),
                        if (leading != null && !isBlankString(text))
                          horizontalSpaceSmall,
                        if (!isBlankString(text)) textWidget!,
                      ],
                    )
                  : FittedBox(
                      child: loading(
                        hasPadding: false,
                        //size: width ?? height,
                      ),
                    ),
            )),
      ),
    );
    /* child = SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: child,
    ); */
    return child;
  }
} */
