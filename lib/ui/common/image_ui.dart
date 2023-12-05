// ignore_for_file: prefer_if_null_operators, sized_box_for_whitespace

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../app/enum/image_type.dart';
import '../../app/util/string_list_helper.dart';
import 'color.dart';
import 'data.dart';
import 'style.dart';
import 'ui_helpers.dart';

class ImageUi extends StatelessWidget {
  final dynamic image;
  final ImageType imageType;
  final String? label;
  final bool isAvatar;
  final double? height;
  final double? width;
  final BoxFit fit;
  final bool isCircle;
  final double radius;
  final String? placeholderImg;
  final double elevation;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool disabled;
  final Color? textColor;
  final double? textSize;
  final String? fallbackImage;
  final IconData? fallbackIcon;
  final Color? fallbackIconColor;
  final double? fallbackIconSize;
  final bool prioritizeFallbackIcon;
  final bool forceFallback;
  final String? heroTag;

  const ImageUi({
    Key? key,
    required this.image,
    required this.imageType,
    this.label,
    this.fallbackImage,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.isCircle = false,
    this.prioritizeFallbackIcon = false,
    this.radius = 0,
    this.placeholderImg,
    this.elevation = 0,
    this.backgroundColor,
    this.onTap,
    this.disabled = false,
    this.heroTag,
  })  : isAvatar = false,
        fallbackIcon = null,
        fallbackIconColor = null,
        fallbackIconSize = null,
        textColor = null,
        textSize = null,
        forceFallback = false,
        super(key: key);

  const ImageUi.avatar({
    Key? key,
    required this.image,
    required this.imageType,
    required this.label,
    this.fallbackImage,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.isCircle = true,
    this.radius = 0,
    this.placeholderImg,
    this.elevation = 2,
    this.backgroundColor,
    this.onTap,
    this.disabled = false,
    this.textColor,
    this.textSize,
    this.fallbackIcon = Icons.account_box,
    this.fallbackIconColor = Colors.white,
    this.fallbackIconSize,
    this.prioritizeFallbackIcon = false,
    this.forceFallback = false,
    this.heroTag,
  })  : isAvatar = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = empty;

    if (forceFallback) {
      child = Container(
        height: height ?? width,
        width: width ?? height,
        child: Icon(
          fallbackIcon,
          color: fallbackIconColor,
          size: (height != null)
              ? height! / 2
              : (width != null)
                  ? width! / 2
                  : null,
        ),
      );
    } else {
      switch (imageType) {
        case ImageType.network:
          child = FadeInImage.assetNetwork(
            image: image as String,
            height: fit != BoxFit.cover ? null : height ?? width,
            width: fit != BoxFit.cover ? null : width ?? height,
            placeholder: placeholderImg ?? AppData.placeholderImg,
            imageErrorBuilder: (context, exception, stackTrace) =>
                _buildFallbackWidget(context: context),
            fit: fit,
            imageSemanticLabel: label,
          );

          break;
        case ImageType.asset:
          child = Image.asset(
            image as String,
            fit: fit,
            errorBuilder: (context, url, error) =>
                _buildFallbackWidget(context: context),
            semanticLabel: label,
          );
          break;
        case ImageType.file:
          child = Image.file(
            image as File,
            fit: fit,
            errorBuilder: (context, url, error) =>
                _buildFallbackWidget(context: context),
            semanticLabel: label,
          );
          break;
        default:
      }
    }

    child = Center(child: child);
    if (!isBlankString(heroTag)) child = Hero(tag: heroTag!, child: child);

    child = Material(
      type: MaterialType.card,
      borderRadius: isCircle || radius == 0
          ? null
          : AppStyle.buildBorderRadius(radius: radius),
      shape: isCircle ? const CircleBorder() : null,
      clipBehavior: Clip.hardEdge,
      color: backgroundColor != null
          ? backgroundColor
          : isAvatar
              ? Theme.of(context).colorScheme.secondary
              : AppColor.transparent,
      elevation: elevation,
      child: onTap != null
          ? InkWell(
              onTap: disabled ? null : onTap,
              child: child,
            )
          : child,
    );

    return child;
  }

  Widget _buildFallbackWidget({required BuildContext context}) {
    return !isAvatar
        ? Image.asset(
            fallbackImage ?? AppData.placeholderImg,
            fit: fit,
          )
        : isBlankString(label) || prioritizeFallbackIcon
            ? Icon(
                fallbackIcon,
                color: fallbackIconColor,
                size: fallbackIconSize != null
                    ? fallbackIconSize
                    : (height != null)
                        ? height! / 2
                        : (width != null)
                            ? width! / 2
                            : null,
              )
            : Center(
                child: AutoSizeText(
                  getInitial(name: label),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: textColor,
                        fontSize: textSize,
                      ),
                ),
              );
  }
}
