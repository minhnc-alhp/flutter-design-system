// core/design_system/src/theme/preset_preview.dart
//
// Preset preview derived from semantic AppColors.
// - background: nhận diện tone (light/dark feel)
// - primary: màu nhấn chính (brand/primary)
// - accents: optional swatches cho UI nâng cao (secondary/accent/success...)

library;

import 'dart:ui' show Color;

import 'package:flutter/foundation.dart';

@immutable
class PresetPreview {
  final Color background;
  final Color primary;

  /// Optional extra swatches for richer preview UI.
  /// Suggested order: secondary, accent, success...
  final List<Color> accents;

  const PresetPreview({
    required this.background,
    required this.primary,
    this.accents = const <Color>[],
  });
}
