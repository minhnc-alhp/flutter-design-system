/// Semantic mapping profile for choosing shade keys from:
/// - Neutral scale (background/surface/text/border/disabled/scrim)
/// - Brand selections (primary/success/warning/danger...)
/// - Brand containers (primaryContainer/dangerContainer...)
///
/// Goal: keep ONE build pipeline, but allow presets to tune shade indices.
///
/// Supported keys: 0, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950.
/// Unknown keys fallback to 500 by ColorScale.shade().
library;

import 'package:flutter/foundation.dart';

@immutable
class AppBrandShadeMapping {
  final int primary;
  final int secondary;
  final int accent;

  final int success;
  final int warning;
  final int danger;
  final int info;

  const AppBrandShadeMapping({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
  });

  static const AppBrandShadeMapping lightDefaults = AppBrandShadeMapping(
    primary: 600,
    secondary: 600,
    accent: 600,
    success: 600,
    warning: 600,
    danger: 600,
    info: 600,
  );

  static const AppBrandShadeMapping darkDefaults = AppBrandShadeMapping(
    primary: 400,
    secondary: 400,
    accent: 400,
    success: 400,
    warning: 400,
    danger: 400,
    info: 400,
  );
}

@immutable
class AppBrandContainerShadeMapping {
  final int primaryContainer;
  final int secondaryContainer;
  final int successContainer;
  final int warningContainer;
  final int dangerContainer;
  final int infoContainer;

  const AppBrandContainerShadeMapping({
    required this.primaryContainer,
    required this.secondaryContainer,
    required this.successContainer,
    required this.warningContainer,
    required this.dangerContainer,
    required this.infoContainer,
  });

  static const AppBrandContainerShadeMapping lightDefaults =
      AppBrandContainerShadeMapping(
        primaryContainer: 100,
        secondaryContainer: 100,
        successContainer: 100,
        warningContainer: 100,
        dangerContainer: 100,
        infoContainer: 100,
      );

  static const AppBrandContainerShadeMapping darkDefaults =
      AppBrandContainerShadeMapping(
        primaryContainer: 700,
        secondaryContainer: 700,
        successContainer: 700,
        warningContainer: 700,
        dangerContainer: 700,
        infoContainer: 700,
      );
}

@immutable
class AppNeutralShadeMapping {
  // Surfaces
  final int background;
  final int surface;
  final int surfaceSubtle;
  final int surfaceElevated;

  // Content
  final int textPrimary;
  final int textSecondary;
  final int textTertiary;
  final int iconPrimary;
  final int iconSecondary;

  // Lines
  final int border;
  final int divider;

  // States
  final int disabled;
  final int onDisabled;

  // Overlays
  final int scrim;

  const AppNeutralShadeMapping({
    required this.background,
    required this.surface,
    required this.surfaceSubtle,
    required this.surfaceElevated,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.border,
    required this.divider,
    required this.disabled,
    required this.onDisabled,
    required this.scrim,
  });

  static const AppNeutralShadeMapping lightDefaults = AppNeutralShadeMapping(
    background: 0,
    surface: 0,
    surfaceSubtle: 50,
    surfaceElevated: 0,
    textPrimary: 900,
    textSecondary: 700,
    textTertiary: 500,
    iconPrimary: 800,
    iconSecondary: 600,
    border: 200,
    divider: 200,
    disabled: 200,
    onDisabled: 500,
    scrim: 950,
  );

  static const AppNeutralShadeMapping darkDefaults = AppNeutralShadeMapping(
    background: 950,
    surface: 900,
    surfaceSubtle: 900,
    surfaceElevated: 800,
    textPrimary: 50,
    textSecondary: 200,
    textTertiary: 400,
    iconPrimary: 100,
    iconSecondary: 300,
    border: 700,
    divider: 700,
    disabled: 800,
    onDisabled: 500,
    scrim: 950,
  );
}

@immutable
class AppSemanticMappingProfile {
  final AppBrandShadeMapping lightBrand;
  final AppBrandShadeMapping darkBrand;

  final AppBrandContainerShadeMapping lightContainers;
  final AppBrandContainerShadeMapping darkContainers;

  final AppNeutralShadeMapping lightNeutral;
  final AppNeutralShadeMapping darkNeutral;

  const AppSemanticMappingProfile({
    this.lightBrand = AppBrandShadeMapping.lightDefaults,
    this.darkBrand = AppBrandShadeMapping.darkDefaults,
    this.lightContainers = AppBrandContainerShadeMapping.lightDefaults,
    this.darkContainers = AppBrandContainerShadeMapping.darkDefaults,
    this.lightNeutral = AppNeutralShadeMapping.lightDefaults,
    this.darkNeutral = AppNeutralShadeMapping.darkDefaults,
  });
}

abstract final class AppSemanticMappingProfiles {
  const AppSemanticMappingProfiles._();

  /// Current DS behavior (matches AppColors.light/dark hard-coded keys).
  static const AppSemanticMappingProfile material3 =
      AppSemanticMappingProfile();

  /// Forest Neon mapping:
  /// - Dark primary in HTML is #13EC5B => use 500 (not 400).
  /// - Dark muted text in HTML is #92C9A4 => use neutral 400 for secondary/tertiary.
  static const AppSemanticMappingProfile forestNeon = AppSemanticMappingProfile(
    lightBrand: AppBrandShadeMapping(
      primary: 500,
      secondary: 600,
      accent: 600,
      success: 500,
      warning: 500,
      danger: 500,
      info: 600,
    ),

    // ✅ Fix: match dark HTML colors
    darkBrand: AppBrandShadeMapping(
      primary: 500, // #13EC5B
      secondary: 400,
      accent: 400,
      success: 500, // keep same as primary in neon green brand
      warning: 500, // #FFA235 in amberFinanceScale
      danger: 500, // #FF5252
      info: 400,
    ),

    // ✅ Fix: muted text = #92C9A4 (neutral 400)
    darkNeutral: AppNeutralShadeMapping(
      background: 950,
      surface: 900,
      surfaceSubtle: 900,
      surfaceElevated: 800,

      textPrimary: 50,
      textSecondary: 400, // #92C9A4
      textTertiary: 400, // #92C9A4
      iconPrimary: 100,
      iconSecondary: 400, // #92C9A4

      border: 700,
      divider: 700,
      disabled: 800,
      onDisabled: 500,
      scrim: 950,
    ),
  );

  /// Paper Neon Light BG:
  /// - background uses neutral[50] (#F6F8F6)
  /// - surface/cards use neutral[0] (#FFFFFF)
  /// - text uses neutral[800]/[500] to match HTML (#1F2937/#6B7280)
  static const AppSemanticMappingProfile paperNeon = AppSemanticMappingProfile(
    lightBrand: AppBrandShadeMapping(
      primary: 500,
      secondary: 600,
      accent: 600,
      success: 500,
      warning: 500,
      danger: 500,
      info: 600,
    ),
    lightNeutral: AppNeutralShadeMapping(
      background: 50, // #F6F8F6
      surface: 0, // #FFFFFF
      surfaceSubtle: 50, // #F6F8F6
      surfaceElevated: 0, // #FFFFFF

      textPrimary: 800, // #1F2937
      textSecondary: 500, // #6B7280
      textTertiary: 500,
      iconPrimary: 800,
      iconSecondary: 600,

      border: 200, // #E0E0E0
      divider: 200,
      disabled: 200,
      onDisabled: 500,
      scrim: 950,
    ),
  );

  /// Midnight mapping:
  /// - bg: #0D1A2E => neutral[950]
  /// - surface/card: #1A2C42 => neutral[900]
  /// - border: #3C5A7F => neutral[700]
  /// - muted text: #8FA3BC => neutral[400]
  /// - text main in mocks is pure white => neutral[0]
  static const AppSemanticMappingProfile midnight = AppSemanticMappingProfile(
    lightBrand: AppBrandShadeMapping(
      primary: 500,
      secondary: 600,
      accent: 600,
      success: 500,
      warning: 500,
      danger: 500,
      info: 600,
    ),
    darkBrand: AppBrandShadeMapping(
      primary: 500, // #00E676
      secondary: 400,
      accent: 400,
      success: 500,
      warning: 500,
      danger: 500,
      info: 400,
    ),
    darkNeutral: AppNeutralShadeMapping(
      background: 950,
      surface: 900,
      surfaceSubtle: 900,
      surfaceElevated: 800,

      textPrimary: 0, // white
      textSecondary: 400, // #8FA3BC
      textTertiary: 400,
      iconPrimary: 0,
      iconSecondary: 400,

      border: 700, // #3C5A7F
      divider: 700,
      disabled: 800,
      onDisabled: 500,
      scrim: 950,
    ),
  );

  /// Graphite Orange mapping (dark only; light uses defaults).
  static const AppSemanticMappingProfile graphiteOrange =
      AppSemanticMappingProfile(
        darkBrand: AppBrandShadeMapping(
          primary: 500, // #FFAB40
          secondary: 400,
          accent: 400,
          success: 500,
          warning: 500, // same as primary
          danger: 500, // #FF4545
          info: 400,
        ),
        darkNeutral: AppNeutralShadeMapping(
          background: 950, // #1E1E1E
          surface: 900, // #2C2C2C
          surfaceSubtle: 900,
          surfaceElevated: 800, // #303030

          textPrimary: 0, // white
          textSecondary: 400, // #A0A0A0
          textTertiary: 400,
          iconPrimary: 0,
          iconSecondary: 400,

          border: 700, // #404040
          divider: 700,
          disabled: 800,
          onDisabled: 500,
          scrim: 950,
        ),
      );
}
