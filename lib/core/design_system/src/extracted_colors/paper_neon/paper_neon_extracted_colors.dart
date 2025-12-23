/// Raw color literals for the Paper Neon (light background) variant.
/// - Source-of-truth list for future refactors.
/// - Palette scales may choose a subset of these values.
library;

import 'package:flutter/material.dart';

final class PaperNeonExtractedColors {
  const PaperNeonExtractedColors._();

  // Surfaces
  static const Color background = Color(0xFFF6F8F6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE0E0E0);

  // Content
  static const Color textMain = Color(0xFF1F2937);
  static const Color textMuted = Color(0xFF6B7280);

  // Brand (neon green)
  static const Color primary = Color(0xFF13EC5B);

  // Status (from the same HTML set)
  static const Color warning = Color(0xFFFFA235);
  static const Color danger = Color(0xFFFF5252);
}
