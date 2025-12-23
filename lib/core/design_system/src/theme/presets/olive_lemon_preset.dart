// core/design_system/src/theme/presets/olive_lemon_preset.dart
//
// Lemon-yellow primary on an olive dark background.
library;

import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
class OliveLemonPreset {
  const OliveLemonPreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'oliveLemon',
    displayName: 'Olive Lemon',
    palettes: PrimitivePalettes.oliveLemon,
    brand: BrandColorSelection.lemonYellow,
    toneBrightness: Brightness.dark,
    mappingProfile: AppSemanticMappingProfiles.oliveLemon,
    description: 'Dark tone: olive background + lemon yellow primary.',
  );
}
