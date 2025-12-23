// core/design_system/src/theme/presets/paper_lemon_preset.dart
//
// Lemon-yellow primary on a warm paper background.
library;

import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
class PaperLemonPreset {
  const PaperLemonPreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'paperLemon',
    displayName: 'Paper Lemon',
    palettes: PrimitivePalettes.paperLemon,
    brand: BrandColorSelection.lemonYellow,
    toneBrightness: Brightness.light,
    mappingProfile: AppSemanticMappingProfiles.paperLemon,
    description: 'Light tone: paper background + lemon yellow primary.',
  );
}
