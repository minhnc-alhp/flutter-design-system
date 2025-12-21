/// Internal shared implementation for bottom bar items.
///
/// Used by:
/// - AppBottomBar
/// - AppBottomBarCenterAction (center action variant)
///
/// Not exported in design_system.dart on purpose.
library;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../theme/theme_extensions/ds_extensions.dart';
import 'app_bottom_bar_style.dart';
import 'navigation_item.dart';

@internal
@immutable
class BottomBarItemView extends StatelessWidget {
  final AppNavigationItem item;
  final bool selected;
  final bool showLabel;
  final VoidCallback? onTap;

  /// Optional per-instance overrides (app-level customization).
  final AppBottomBarStyle? style;

  const BottomBarItemView({
    super.key,
    required this.item,
    required this.selected,
    required this.showLabel,
    required this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final nav = context.dsComponents.navigation;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bool enabled = onTap != null;

    final Color selectedFg = style?.selectedForegroundColor ?? scheme.primary;
    final Color unselectedFg =
        style?.unselectedForegroundColor ?? scheme.onSurfaceVariant;
    final Color disabledFg =
        style?.disabledForegroundColor ?? theme.disabledColor;

    final Color fg = !enabled
        ? disabledFg
        : (selected ? selectedFg : unselectedFg);

    final double iconSize = style?.iconSize ?? nav.navIconSize;

    final double scale = selected
        ? (style?.selectedIconScale ?? nav.bottomBarSelectedIconScale)
        : (style?.unselectedIconScale ?? nav.bottomBarUnselectedIconScale);

    final Duration animDuration =
        style?.selectionAnimDuration ?? nav.bottomBarSelectionAnimDuration;
    final Curve animCurve = style?.selectionAnimCurve ?? Curves.easeOut;

    final double itemPaddingX = style?.itemPaddingX ?? nav.itemPaddingX;
    final double iconPaddingY =
        style?.iconPaddingY ?? nav.bottomBarIconPaddingY;

    final double labelPaddingTop =
        style?.labelPaddingTop ?? nav.bottomBarLabelPaddingTop;
    final double labelPaddingBottom =
        style?.labelPaddingBottom ?? nav.bottomBarLabelPaddingBottom;

    final Color itemBg = selected
        ? (style?.selectedItemBackgroundColor ?? Colors.transparent)
        : (style?.unselectedItemBackgroundColor ?? Colors.transparent);

    final BorderRadius itemRadius =
        style?.itemBorderRadius ?? context.dsRadii.md;

    final IconData resolvedIcon = item.iconForSelected(selected);

    final TextStyle baseLabel =
        style?.labelTextStyle ?? (textTheme.labelSmall ?? const TextStyle());

    final int labelMaxLines = style?.labelMaxLines ?? 1;
    final TextOverflow labelOverflow =
        style?.labelOverflow ?? TextOverflow.ellipsis;

    final Widget content = Padding(
      padding: context.dsSpacing.symmetric(horizontal: itemPaddingX),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _NavIconWithBadge(
              icon: resolvedIcon,
              iconSize: iconSize,
              color: fg,
              scale: scale,
              scaleAnimDuration: animDuration,
              scaleAnimCurve: animCurve,
              iconPaddingY: iconPaddingY,
              badge: item.badge,
              badgeCount: item.badgeCount,
              showBadgeWhenZero: item.showBadgeWhenZero,
            ),
            if (showLabel)
              Padding(
                padding: context.dsSpacing.only(
                  top: labelPaddingTop,
                  bottom: labelPaddingBottom,
                ),
                child: Text(
                  item.label,
                  maxLines: labelMaxLines,
                  overflow: labelOverflow,
                  style: baseLabel.copyWith(color: fg),
                ),
              ),
          ],
        ),
      ),
    );

    final Widget decorated = AnimatedContainer(
      duration: animDuration,
      curve: animCurve,
      decoration: BoxDecoration(color: itemBg, borderRadius: itemRadius),
      child: content,
    );

    final BottomBarTapEffect tapEffect =
        style?.tapEffect ?? BottomBarTapEffect.none;

    Widget interactive;
    if (tapEffect == BottomBarTapEffect.ink && enabled) {
      interactive = Material(
        type: MaterialType.transparency,
        child: InkResponse(
          onTap: onTap,
          containedInkWell: true,
          enableFeedback: style?.enableFeedback ?? true,
          splashColor: style?.splashColor,
          highlightColor: style?.highlightColor,
          borderRadius: itemRadius,
          child: decorated,
        ),
      );
    } else {
      interactive = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: decorated,
      );
    }

    return Semantics(
      button: true,
      selected: selected,
      enabled: enabled,
      label: item.semanticsLabel ?? item.label,
      child: interactive,
    );
  }
}

@immutable
class _NavIconWithBadge extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color color;

  final double scale;
  final Duration scaleAnimDuration;
  final Curve scaleAnimCurve;
  final double iconPaddingY;

  final Widget? badge;
  final int? badgeCount;
  final bool showBadgeWhenZero;

  const _NavIconWithBadge({
    required this.icon,
    required this.iconSize,
    required this.color,
    required this.scale,
    required this.scaleAnimDuration,
    required this.scaleAnimCurve,
    required this.iconPaddingY,
    required this.badge,
    required this.badgeCount,
    required this.showBadgeWhenZero,
  });

  bool get _hasBadge {
    if (badge != null) return true;
    if (badgeCount == null) return false;
    if (badgeCount! > 0) return true;
    return showBadgeWhenZero;
  }

  @override
  Widget build(BuildContext context) {
    final Widget iconWidget = Padding(
      padding: context.dsSpacing.only(top: iconPaddingY, bottom: iconPaddingY),
      child: AnimatedScale(
        scale: scale,
        duration: scaleAnimDuration,
        curve: scaleAnimCurve,
        child: Icon(icon, size: iconSize, color: color),
      ),
    );

    if (!_hasBadge) return ExcludeSemantics(child: iconWidget);

    return ExcludeSemantics(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          iconWidget,
          Positioned(
            right: -(context.dsSpacing.spacing.xs),
            top: -(context.dsSpacing.spacing.xs),
            child:
                badge ??
                _DefaultBadge(
                  count: badgeCount,
                  showWhenZero: showBadgeWhenZero,
                ),
          ),
        ],
      ),
    );
  }
}

@immutable
class _DefaultBadge extends StatelessWidget {
  final int? count;
  final bool showWhenZero;

  const _DefaultBadge({required this.count, required this.showWhenZero});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final s = context.dsSpacing;

    final bool isDot = (count == null) || (count == 0 && showWhenZero);

    final bg = scheme.errorContainer;
    final fg = scheme.onErrorContainer;

    if (isDot) {
      final double dot = context.dsSpacing.spacing.sm;
      return Container(
        width: dot,
        height: dot,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: context.dsRadii.circular(context.dsRadii.shape.xl),
        ),
      );
    }

    final String text = count! > 99 ? '99+' : '${count!}';

    return Container(
      padding: s.symmetric(
        horizontal: context.dsSpacing.spacing.xs,
        vertical: context.dsSpacing.spacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: context.dsRadii.circular(context.dsRadii.shape.xl),
      ),
      child: Text(text, style: textTheme.labelSmall?.copyWith(color: fg)),
    );
  }
}
