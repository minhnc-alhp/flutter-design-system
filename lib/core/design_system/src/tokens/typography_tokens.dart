/// Typography primitive tokens (no TextStyle).
/// - Provides raw values only: font families, weights (numeric), sizes, line-heights, letter-spacing.
/// - Semantic type roles (e.g., titleLarge/bodyMedium) must be mapped at foundations/theme layers.
library;

import 'package:flutter/material.dart';

@immutable
class FontFamilyTokens {
  const FontFamilyTokens._();

  /// Based on HTML mocks (Manrope is the main font).
  /// If fonts are not bundled, Flutter will fall back automatically.
  static const String sansPrimary = 'Manrope';
  static const String sansSecondary = 'Noto Sans';
  static const String sansTertiary = 'Inter';
  static const String sansFallback = 'Roboto';

  static const List<String> sansStack = <String>[
    sansPrimary,
    sansSecondary,
    sansTertiary,
    sansFallback,
  ];

  static const String monoPrimary = 'JetBrains Mono';
  static const String monoFallback = 'monospace';
  static const List<String> monoStack = <String>[monoPrimary, monoFallback];
}

@immutable
class FontWeightTokens {
  /// Numeric weights for mapping later to platform weights.
  static const int w100 = 100;
  static const int w200 = 200;
  static const int w300 = 300;
  static const int w400 = 400;
  static const int w500 = 500;
  static const int w600 = 600;
  static const int w700 = 700;
  static const int w800 = 800;
  static const int w900 = 900;

  const FontWeightTokens._();
}

@immutable
class FontSizeTokens {
  /// Font sizes (px). Keep a tight scale for fintech readability.
  static const double f10 = 10;
  static const double f12 = 12;
  static const double f14 = 14;
  static const double f16 = 16;
  static const double f18 = 18;
  static const double f20 = 20;
  static const double f24 = 24;
  static const double f28 = 28;
  static const double f32 = 32;
  static const double f36 = 36;
  static const double f40 = 40;
  static const double f48 = 48;

  const FontSizeTokens._();
}

@immutable
class LineHeightTokens {
  /// Absolute line-heights (px), to be converted into `TextStyle.height` later.
  static const double lh12 = 12;
  static const double lh16 = 16;
  static const double lh20 = 20;
  static const double lh24 = 24;
  static const double lh28 = 28;
  static const double lh32 = 32;
  static const double lh36 = 36;
  static const double lh40 = 40;
  static const double lh48 = 48;
  static const double lh56 = 56;
  static const double lh64 = 64;

  const LineHeightTokens._();
}

@immutable
class LetterSpacingTokens {
  /// Letter spacing (px). Use sparingly; map to roles elsewhere.
  static const double n05 = -0.5;
  static const double n02 = -0.2;
  static const double z0 = 0.0;
  static const double p02 = 0.2;
  static const double p04 = 0.4;
  static const double p08 = 0.8;

  const LetterSpacingTokens._();
}
