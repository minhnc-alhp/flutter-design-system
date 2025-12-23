// Royal Blue preset (dark tone).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
final class RoyalBluePreset {
  const RoyalBluePreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'royalBlue',
    displayName: 'Royal Blue',
    palettes: PrimitivePalettes.royalBlue,
    brand: BrandColorSelection.royalBlue,
    toneBrightness: Brightness.dark, // preset 1 tone
    mappingProfile: AppSemanticMappingProfiles.royalBlue,
    description: 'Dark background + royal blue brand (from HTML).',
  );
}
