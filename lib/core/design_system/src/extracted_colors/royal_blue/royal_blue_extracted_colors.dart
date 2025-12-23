/// Raw color literals extracted from the expense-app HTML prototypes (Royal Blue variant).
/// - Source-of-truth list for future refactors.
/// - Palette scales may choose a subset of these values.
library;

import 'package:flutter/material.dart';

final class RoyalBlueExtractedColors {
  const RoyalBlueExtractedColors._();

  // Base
  static const Color white = Color(0xFFFFFFFF);

  // Light tone
  static const Color backgroundLight = Color(0xFFF6F6F8);
  static const Color backgroundLightAlt = Color(0xFFF8F9FC);
  static const Color borderLight = Color(0xFFE7EBF3);
  static const Color textMainLight = Color(0xFF0D121B);
  static const Color textMutedLight = Color(0xFF4C669A);

  // Dark tone
  static const Color backgroundDark = Color(0xFF101622);
  static const Color surfaceDark = Color(0xFF1C2433);
  static const Color surfaceDarkAlt = Color(0xFF1A202C);
  static const Color borderDark = Color(0xFF2D3748);
  static const Color textMainDark = Color(0xFFE0E6ED);
  static const Color textMutedDark = Color(0xFF94A3B8);

  // Brand
  static const Color primary = Color(0xFF2B6CEE);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Status (tailwind-ish)
  static const Color success = Color(0xFF10B981);
  static const Color danger = Color(0xFFEF4444);
}
