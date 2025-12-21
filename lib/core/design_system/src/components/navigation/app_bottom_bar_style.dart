/// Bottom bar style overrides (optional).
/// - If a field is null => DS falls back to token/theme defaults.
/// - Keep this as a "configuration object" so apps can override many things
///   without changing DS internals.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Tap feedback strategy for bottom bar items.
enum BottomBarTapEffect {
  /// No ink/splash. (Default – matches current DS behavior)
  none,

  /// Use InkResponse for splash/highlight.
  ink,
}

@immutable
class AppBottomBarStyle {
  // ===== Bar container =====
  final double? height;
  final bool? reserveBottomSafeArea;
  final EdgeInsetsGeometry? contentPadding;

  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final BorderSide? topBorder;

  // ===== Items layout/typography =====
  final double? itemPaddingX;

  final double? iconSize;
  final double? selectedIconScale;
  final double? unselectedIconScale;
  final double? iconPaddingY;

  final double? labelPaddingTop;
  final double? labelPaddingBottom;
  final TextStyle? labelTextStyle;
  final int? labelMaxLines;
  final TextOverflow? labelOverflow;

  // ===== Item colors =====
  final Color? selectedForegroundColor;
  final Color? unselectedForegroundColor;
  final Color? disabledForegroundColor;

  // Optional selection background
  final Color? selectedItemBackgroundColor;
  final Color? unselectedItemBackgroundColor;
  final BorderRadius? itemBorderRadius;

  // ===== Animations =====
  final Duration? selectionAnimDuration;
  final Curve? selectionAnimCurve;

  // ===== Interaction =====
  final BottomBarTapEffect? tapEffect;
  final bool? enableFeedback; // only applies when tapEffect == ink
  final Color? splashColor;
  final Color? highlightColor;

  // ===== Center action (FAB-like) =====
  final double? centerActionSize;
  final double? centerActionDockPaddingX;
  final double? centerActionBottomPadding;
  final double? centerActionBorderWidth;
  final Color? centerActionBorderColor;

  /// Force the center action to be circular (ClipOval).
  /// Useful if app passes FloatingActionButton.extended or a custom widget.
  final bool? centerActionEnforceCircle;

  /// Optional IconTheme overrides for the center action content.
  final double? centerActionIconSize;
  final Color? centerActionIconColor;

  const AppBottomBarStyle({
    this.height,
    this.reserveBottomSafeArea,
    this.contentPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.topBorder,
    this.itemPaddingX,
    this.iconSize,
    this.selectedIconScale,
    this.unselectedIconScale,
    this.iconPaddingY,
    this.labelPaddingTop,
    this.labelPaddingBottom,
    this.labelTextStyle,
    this.labelMaxLines,
    this.labelOverflow,
    this.selectedForegroundColor,
    this.unselectedForegroundColor,
    this.disabledForegroundColor,
    this.selectedItemBackgroundColor,
    this.unselectedItemBackgroundColor,
    this.itemBorderRadius,
    this.selectionAnimDuration,
    this.selectionAnimCurve,
    this.tapEffect,
    this.enableFeedback,
    this.splashColor,
    this.highlightColor,
    this.centerActionSize,
    this.centerActionDockPaddingX,
    this.centerActionBottomPadding,
    this.centerActionBorderWidth,
    this.centerActionBorderColor,
    this.centerActionEnforceCircle,
    this.centerActionIconSize,
    this.centerActionIconColor,
  });

  AppBottomBarStyle copyWith({
    double? height,
    bool? reserveBottomSafeArea,
    EdgeInsetsGeometry? contentPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    BorderSide? topBorder,
    double? itemPaddingX,
    double? iconSize,
    double? selectedIconScale,
    double? unselectedIconScale,
    double? iconPaddingY,
    double? labelPaddingTop,
    double? labelPaddingBottom,
    TextStyle? labelTextStyle,
    int? labelMaxLines,
    TextOverflow? labelOverflow,
    Color? selectedForegroundColor,
    Color? unselectedForegroundColor,
    Color? disabledForegroundColor,
    Color? selectedItemBackgroundColor,
    Color? unselectedItemBackgroundColor,
    BorderRadius? itemBorderRadius,
    Duration? selectionAnimDuration,
    Curve? selectionAnimCurve,
    BottomBarTapEffect? tapEffect,
    bool? enableFeedback,
    Color? splashColor,
    Color? highlightColor,
    double? centerActionSize,
    double? centerActionDockPaddingX,
    double? centerActionBottomPadding,
    double? centerActionBorderWidth,
    Color? centerActionBorderColor,
    bool? centerActionEnforceCircle,
    double? centerActionIconSize,
    Color? centerActionIconColor,
  }) {
    return AppBottomBarStyle(
      height: height ?? this.height,
      reserveBottomSafeArea:
          reserveBottomSafeArea ?? this.reserveBottomSafeArea,
      contentPadding: contentPadding ?? this.contentPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      topBorder: topBorder ?? this.topBorder,
      itemPaddingX: itemPaddingX ?? this.itemPaddingX,
      iconSize: iconSize ?? this.iconSize,
      selectedIconScale: selectedIconScale ?? this.selectedIconScale,
      unselectedIconScale: unselectedIconScale ?? this.unselectedIconScale,
      iconPaddingY: iconPaddingY ?? this.iconPaddingY,
      labelPaddingTop: labelPaddingTop ?? this.labelPaddingTop,
      labelPaddingBottom: labelPaddingBottom ?? this.labelPaddingBottom,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      labelMaxLines: labelMaxLines ?? this.labelMaxLines,
      labelOverflow: labelOverflow ?? this.labelOverflow,
      selectedForegroundColor:
          selectedForegroundColor ?? this.selectedForegroundColor,
      unselectedForegroundColor:
          unselectedForegroundColor ?? this.unselectedForegroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? this.disabledForegroundColor,
      selectedItemBackgroundColor:
          selectedItemBackgroundColor ?? this.selectedItemBackgroundColor,
      unselectedItemBackgroundColor:
          unselectedItemBackgroundColor ?? this.unselectedItemBackgroundColor,
      itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
      selectionAnimDuration:
          selectionAnimDuration ?? this.selectionAnimDuration,
      selectionAnimCurve: selectionAnimCurve ?? this.selectionAnimCurve,
      tapEffect: tapEffect ?? this.tapEffect,
      enableFeedback: enableFeedback ?? this.enableFeedback,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      centerActionSize: centerActionSize ?? this.centerActionSize,
      centerActionDockPaddingX:
          centerActionDockPaddingX ?? this.centerActionDockPaddingX,
      centerActionBottomPadding:
          centerActionBottomPadding ?? this.centerActionBottomPadding,
      centerActionBorderWidth:
          centerActionBorderWidth ?? this.centerActionBorderWidth,
      centerActionBorderColor:
          centerActionBorderColor ?? this.centerActionBorderColor,
      centerActionEnforceCircle:
          centerActionEnforceCircle ?? this.centerActionEnforceCircle,
      centerActionIconSize: centerActionIconSize ?? this.centerActionIconSize,
      centerActionIconColor:
          centerActionIconColor ?? this.centerActionIconColor,
    );
  }
}
