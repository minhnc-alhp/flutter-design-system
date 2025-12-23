// lib/core/design_system/src/theme/presets/midnight_preset.dart
//
// Midnight palette preset extracted from HTML mocks.
// - Uses PrimitivePalettes.midnight (navy neutrals + emerald brand)

library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
final class MidnightPreset {
  const MidnightPreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'midnight',
    displayName: 'Midnight',
    palettes: PrimitivePalettes.midnight,
    brand: BrandColorSelection.emerald,
    // Preset chỉ có 1 tone duy nhất (contract của PalettePreset)
    toneBrightness: Brightness.dark,
    mappingProfile: AppSemanticMappingProfiles.midnight,
    description: 'Navy/dark background variant from HTML mocks.',
  );
}
