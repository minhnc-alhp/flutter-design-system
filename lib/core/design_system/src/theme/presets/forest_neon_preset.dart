// lib/core/design_system/src/theme/presets/forest_neon_preset.dart
//
// Forest Neon palette preset extracted from HTML mocks.
// - Uses PrimitivePalettes.forestNeon (green-tinted neutrals + neon green brand)

library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
final class ForestNeonPreset {
  const ForestNeonPreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'forestNeon',
    displayName: 'Forest Neon',
    palettes: PrimitivePalettes.forestNeon,
    brand: BrandColorSelection.neonGreen,
    toneBrightness: Brightness.dark,
    mappingProfile: AppSemanticMappingProfiles.forestNeon,
    description: 'From HTML mocks (overview/history/plan/debt).',
  );
}
