/// Raw color literals for the Olive Lemon (dark background) variant.
/// - Source-of-truth list for future refactors.
/// - Palette scales may choose a subset of these values.
library;

import 'package:flutter/material.dart';

final class OliveLemonExtractedColors {
  const OliveLemonExtractedColors._();

  // Surfaces
  static const Color background = Color(0xFF23220F);
  static const Color surface = Color(0xFF2C2B14);
  static const Color surfaceAlt = Color(0xFF2C2B18);
  static const Color surfaceElevated = Color(0xFF2D2C1B);
  static const Color surfaceElevated2 = Color(0xFF343215);

  // Content
  static const Color textMain = Color(0xFFE6E6E0);
  static const Color textMuted = Color(0xFFA8A89D);
  static const Color textTertiary = Color(0xFF7A7A58);

  // Brand
  static const Color primary = Color(0xFFF9F506);
  static const Color primaryDark = Color(0xFFC2BF00);
}
