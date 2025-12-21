/// DS Bottom Navigation Bar primitive (custom implementation).
/// - No routing logic. Exposes selectedIndex + onSelected callback.
/// - Token/theme-driven via DS extensions + ColorScheme/TextTheme.
/// - Custom Row layout with GestureDetector by default (no ink effects).
library;

import 'package:flutter/material.dart';

import '../../theme/theme_extensions/ds_extensions.dart';
import '_bottom_bar_item_view.dart';
import 'app_bottom_bar_style.dart';
import 'navigation_item.dart';

@immutable
class AppBottomBar extends StatelessWidget {
  final List<AppNavigationItem> items;

  /// Selected index managed by app layer.
  final int selectedIndex;

  /// App layer wiring (route changes) happens here.
  final ValueChanged<int> onSelected;

  /// Whether labels should be shown.
  final bool showLabels;

  /// Optional semantics label for accessibility grouping.
  final String? semanticsLabel;

  /// Optional per-instance style overrides.
  final AppBottomBarStyle? style;

  /// Optional override for reserving bottom safe-area.
  /// If null => uses [style.reserveBottomSafeArea] or defaults to true.
  final bool? reserveBottomSafeArea;

  const AppBottomBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
    this.showLabels = true,
    this.semanticsLabel,
    this.style,
    this.reserveBottomSafeArea,
  });

  @override
  Widget build(BuildContext context) {
    final nav = context.dsComponents.navigation;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final int clampedIndex = selectedIndex.clamp(
      0,
      (items.isEmpty ? 0 : items.length - 1),
    );

    final bool reserveSafeArea =
        reserveBottomSafeArea ?? style?.reserveBottomSafeArea ?? true;

    final double bottomInset = reserveSafeArea
        ? MediaQuery.viewPaddingOf(context).bottom
        : 0;

    final double barHeight = style?.height ?? nav.bottomBarHeight;

    final Color bg = style?.backgroundColor ?? scheme.surface;
    final double elevation = style?.elevation ?? 0;
    final Color shadowColor = style?.shadowColor ?? theme.shadowColor;

    final EdgeInsetsGeometry contentPadding =
        style?.contentPadding ?? EdgeInsets.zero;

    final BorderSide? topBorder = style?.topBorder;

    Widget barContent = SizedBox(
      height: barHeight + bottomInset,
      child: Padding(
        // Keep content in the top "barHeight" region, leave bottomInset empty.
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Padding(
          padding: contentPadding,
          child: Row(
            children: <Widget>[
              for (int i = 0; i < items.length; i++)
                Expanded(
                  child: BottomBarItemView(
                    item: items[i],
                    selected: i == clampedIndex,
                    showLabel: showLabels,
                    onTap: items[i].enabled ? () => onSelected(i) : null,
                    style: style,
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    if (topBorder != null) {
      barContent = DecoratedBox(
        decoration: BoxDecoration(border: Border(top: topBorder)),
        child: barContent,
      );
    }

    return Semantics(
      container: true,
      label: semanticsLabel,
      child: Material(
        color: bg,
        elevation: elevation,
        shadowColor: shadowColor,
        child: barContent,
      ),
    );
  }
}
