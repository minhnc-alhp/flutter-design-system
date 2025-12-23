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
class AppOnBrandNeutralMapping {
  final int onPrimary;
  final int onSecondary;
  final int onAccent;

  final int onSuccess;
  final int onWarning;
  final int onDanger;
  final int onInfo;

  const AppOnBrandNeutralMapping({
    required this.onPrimary,
    required this.onSecondary,
    required this.onAccent,
    required this.onSuccess,
    required this.onWarning,
    required this.onDanger,
    required this.onInfo,
  });

  // Match current AppColors.light behavior:
  // - Most on* = surface (0)
  // - onWarning = scrim (950)
  static const AppOnBrandNeutralMapping lightDefaults =
      AppOnBrandNeutralMapping(
        onPrimary: 0,
        onSecondary: 0,
        onAccent: 0,
        onSuccess: 0,
        onWarning: 950,
        onDanger: 0,
        onInfo: 0,
      );

  // Match current AppColors.dark behavior (on* = background, usually 950)
  static const AppOnBrandNeutralMapping darkDefaults = AppOnBrandNeutralMapping(
    onPrimary: 950,
    onSecondary: 950,
    onAccent: 950,
    onSuccess: 950,
    onWarning: 950,
    onDanger: 950,
    onInfo: 950,
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

  final AppOnBrandNeutralMapping lightOnBrand;
  final AppOnBrandNeutralMapping darkOnBrand;

  const AppSemanticMappingProfile({
    this.lightBrand = AppBrandShadeMapping.lightDefaults,
    this.darkBrand = AppBrandShadeMapping.darkDefaults,
    this.lightContainers = AppBrandContainerShadeMapping.lightDefaults,
    this.darkContainers = AppBrandContainerShadeMapping.darkDefaults,
    this.lightNeutral = AppNeutralShadeMapping.lightDefaults,
    this.darkNeutral = AppNeutralShadeMapping.darkDefaults,
    this.lightOnBrand = AppOnBrandNeutralMapping.lightDefaults,
    this.darkOnBrand = AppOnBrandNeutralMapping.darkDefaults,
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

  /// Paper Lemon Light BG:
  /// - background uses neutral[50] (#F8F8F5)
  /// - surface/cards use neutral[0] (#FFFFFF)
  /// - text uses neutral[800]/[500] to match HTML (#1C1C0D/#6D6D60)
  static const AppSemanticMappingProfile paperLemon = AppSemanticMappingProfile(
    lightBrand: AppBrandShadeMapping(
      primary: 500, // #F9F506
      secondary: 600,
      accent: 600,
      success: 600,
      warning: 600,
      danger: 600,
      info: 600,
    ),
    // ✅ Key part: chữ đen trên vàng
    lightOnBrand: AppOnBrandNeutralMapping(
      onPrimary: 950, // black
      onSecondary: 0,
      onAccent: 0,
      onSuccess: 0,
      onWarning: 950, // keep black on yellow-ish warnings
      onDanger: 0,
      onInfo: 0,
    ),
    lightNeutral: AppNeutralShadeMapping(
      background: 50,
      surface: 0,
      surfaceSubtle: 100,
      surfaceElevated: 0,
      textPrimary: 800,
      textSecondary: 500,
      textTertiary: 400,
      iconPrimary: 800,
      iconSecondary: 600,
      border: 200,
      divider: 200,
      disabled: 200,
      onDisabled: 500,
      scrim: 950,
    ),
  );

  /// Olive Lemon Dark BG:
  /// - background uses neutral[950] (#23220F)
  /// - surface/cards use neutral[900] (#2C2B14)
  /// - text uses neutral[50]/[200] to match HTML (#E6E6E0/#A8A89D)
  static const AppSemanticMappingProfile oliveLemon = AppSemanticMappingProfile(
    darkBrand: AppBrandShadeMapping(
      primary: 500, // #F9F506
      secondary: 400,
      accent: 400,
      success: 400,
      warning: 500,
      danger: 500,
      info: 400,
    ),
    darkNeutral: AppNeutralShadeMapping(
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
    ),
  );

  /// Royal Blue mapping:
  /// - Light: bg #F6F6F8, text #0D121B, muted #4C669A, border #E7EBF3
  /// - Dark:  bg #101622, surface #1C2433, muted #94A3B8, border #2D3748
  static const AppSemanticMappingProfile royalBlue = AppSemanticMappingProfile(
    lightBrand: AppBrandShadeMapping(
      primary: 500, // #2B6CEE
      secondary: 600,
      accent: 600,
      success: 500,
      warning: 600,
      danger: 500,
      info: 600,
    ),
    darkBrand: AppBrandShadeMapping(
      primary: 500, // keep same primary in dark
      secondary: 400,
      accent: 400,
      success: 500,
      warning: 400,
      danger: 500,
      info: 400,
    ),
    lightNeutral: AppNeutralShadeMapping(
      background: 50, // #F6F6F8
      surface: 0, // white
      surfaceSubtle: 50,
      surfaceElevated: 0,

      textPrimary: 950, // #0D121B
      textSecondary: 500, // #4C669A
      textTertiary: 500,
      iconPrimary: 950,
      iconSecondary: 500,

      border: 100, // #E7EBF3
      divider: 100,
      disabled: 100,
      onDisabled: 400,
      scrim: 950,
    ),
    darkNeutral: AppNeutralShadeMapping(
      background: 900, // #101622
      surface: 800, // #1C2433
      surfaceSubtle: 800,
      surfaceElevated: 700, // #232C3C

      textPrimary: 200, // #E0E6ED
      textSecondary: 400, // #94A3B8
      textTertiary: 400,
      iconPrimary: 200,
      iconSecondary: 400,

      border: 600, // #2D3748
      divider: 600,
      disabled: 700,
      onDisabled: 400,
      scrim: 950, // #0D121B
    ),
  );
}
