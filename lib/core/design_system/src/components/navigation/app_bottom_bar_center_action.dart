/// DS Bottom Navigation Bar variant with a centered action slot (FAB-like).
/// - Keep using [AppBottomBar] when you don't need a center action.
/// - App provides [centerAction] widget (FAB / custom button).
/// - Reserves a dock gap in the middle and overlays the center action via Stack.
/// - Optionally reserves bottom safe-area to avoid overlapping system gesture area.
library;

import 'package:flutter/material.dart';

import '../../theme/theme_extensions/ds_extensions.dart';
import '_bottom_bar_item_view.dart';
import 'app_bottom_bar_style.dart';
import 'navigation_item.dart';

@immutable
class AppBottomBarCenterAction extends StatelessWidget {
  final List<AppNavigationItem> items;

  /// Selected index managed by app layer (index into [items]).
  final int selectedIndex;

  /// App layer wiring happens here.
  final ValueChanged<int> onSelected;

  /// Center action widget (e.g. FloatingActionButton / custom).
  final Widget centerAction;

  /// Optional semantics label for the center action (if the widget doesn't provide one).
  final String? centerActionSemanticsLabel;

  /// Whether labels should be shown.
  final bool showLabels;

  /// Optional semantics label for accessibility grouping.
  final String? semanticsLabel;

  /// Reserve bottom safe-area inset (recommended when used as Scaffold.bottomNavigationBar).
  /// If null => uses [style.reserveBottomSafeArea] or defaults to true.
  final bool? reserveBottomSafeArea;

  /// Optional per-instance style overrides.
  final AppBottomBarStyle? style;

  const AppBottomBarCenterAction({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
    required this.centerAction,
    this.centerActionSemanticsLabel,
    this.showLabels = true,
    this.semanticsLabel,
    this.reserveBottomSafeArea,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final nav = context.dsComponents.navigation;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

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

    // Force FAB circular (Material 3 default is rounded-rect) + allow icon overrides.
    final ThemeData actionTheme = theme.copyWith(
      floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
        shape: const CircleBorder(),
      ),
    );

    final Widget actionWithSemantics = centerActionSemanticsLabel == null
        ? centerAction
        : Semantics(
            button: true,
            label: centerActionSemanticsLabel,
            child: centerAction,
          );

    final Widget actionWithIconTheme =
        (style?.centerActionIconSize != null ||
            style?.centerActionIconColor != null)
        ? IconTheme.merge(
            data: IconThemeData(
              size: style?.centerActionIconSize,
              color: style?.centerActionIconColor,
            ),
            child: actionWithSemantics,
          )
        : actionWithSemantics;

    final bool enforceCircle = style?.centerActionEnforceCircle ?? true;

    final Widget enforcedAction = Theme(
      data: actionTheme,
      child: enforceCircle
          ? ClipOval(child: actionWithIconTheme)
          : actionWithIconTheme,
    );

    final int clampedIndex = selectedIndex.clamp(
      0,
      (items.isEmpty ? 0 : items.length - 1),
    );

    final double borderW =
        style?.centerActionBorderWidth ?? nav.bottomBarCenterActionBorderWidth;
    final double innerSize =
        style?.centerActionSize ?? nav.bottomBarCenterActionSize;
    final double outerSize = innerSize + (borderW * 2);

    final double dockPaddingX =
        style?.centerActionDockPaddingX ??
        nav.bottomBarCenterActionDockPaddingX;
    final double dockWidth = outerSize + (dockPaddingX * 2);

    final double actionBottomPadding =
        style?.centerActionBottomPadding ??
        nav.bottomBarCenterActionBottomPadding;

    final Color borderColor = style?.centerActionBorderColor ?? bg;

    // Split items into left/right groups; reserve the middle dock gap.
    final int leftCount = items.length ~/ 2;

    Widget barContent = SizedBox(
      height: barHeight + bottomInset,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomInset),
              child: Padding(
                padding: contentPadding,
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < leftCount; i++)
                      Expanded(
                        child: BottomBarItemView(
                          item: items[i],
                          selected: i == clampedIndex,
                          showLabel: showLabels,
                          onTap: items[i].enabled ? () => onSelected(i) : null,
                          style: style,
                        ),
                      ),

                    // Dock gap for center action.
                    SizedBox(width: dockWidth),

                    for (int i = leftCount; i < items.length; i++)
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
          ),

          // Overlay center action
          Positioned(
            left: 0,
            right: 0,
            bottom: bottomInset + actionBottomPadding,
            child: Center(
              child: SizedBox.square(
                dimension: outerSize,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(width: borderW, color: borderColor),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(borderW),
                    child: Center(
                      child: SizedBox.square(
                        dimension: innerSize,
                        child: enforcedAction,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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

/// Backward-compatible alias (your ds_gallery may still use this).
@Deprecated('Use AppBottomBarCenterAction')
class AppBottomBarWithCenterAction extends AppBottomBarCenterAction {
  const AppBottomBarWithCenterAction({
    super.key,
    required super.items,
    required super.selectedIndex,
    required super.onSelected,
    required super.centerAction,
    super.centerActionSemanticsLabel,
    super.showLabels = true,
    super.semanticsLabel,
    super.reserveBottomSafeArea,
    super.style,
  });
}
