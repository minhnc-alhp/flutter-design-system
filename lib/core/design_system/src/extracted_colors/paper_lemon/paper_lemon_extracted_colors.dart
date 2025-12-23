/// Raw color literals for the Paper Lemon (light background) variant.
/// - Source-of-truth list for future refactors.
/// - Palette scales may choose a subset of these values.
library;

import 'package:flutter/material.dart';

final class PaperLemonExtractedColors {
  const PaperLemonExtractedColors._();

  // Surfaces
  static const Color background = Color(0xFFF8F8F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSubtle = Color(0xFFF4F4E6);
  static const Color border = Color(0xFFE9E8CE);

  // Content
  static const Color textMain = Color(0xFF1C1C0D);
  static const Color textMuted = Color(0xFF6D6D60);
  static const Color textTertiary = Color(0xFF7A7A58);

  // Brand
  static const Color primary = Color(0xFFF9F506);
  static const Color primaryDark = Color(0xFFC2BF00);

  // Tags (seen in plan page)
  static const Color tagSuccessFg = Color(0xFF166534);
  static const Color tagSuccessBg = Color(0xFFDCFCE7);

  static const Color tagWarningFg = Color(0xFF9A3412);
  static const Color tagWarningBg = Color(0xFFFFEDD5);

  static const Color tagInfoFg = Color(0xFF1E40AF);
  static const Color tagInfoBg = Color(0xFFDBEAFE);
}
