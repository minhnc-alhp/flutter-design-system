// lib/core/design_system/src/theme/presets/paper_neon_preset.dart
//
// Paper Neon preset (light background variant).
// - Uses PrimitivePalettes.paperNeon (paper-like neutral + neon green brand)

library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
final class PaperNeonPreset {
  const PaperNeonPreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'paperNeon',
    displayName: 'Paper Neon',
    palettes: PrimitivePalettes.paperNeon,
    brand: BrandColorSelection.neonGreen,
    toneBrightness: Brightness.light,
    mappingProfile: AppSemanticMappingProfiles.paperNeon,
    description: 'Light background variant from HTML mocks.',
  );
}
