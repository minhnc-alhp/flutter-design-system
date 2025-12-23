// Paper Royal Blue preset (light tone).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
final class PaperRoyalBluePreset {
  const PaperRoyalBluePreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'paperRoyalBlue',
    displayName: 'Paper Royal Blue',
    palettes: PrimitivePalettes.royalBlue,
    brand: BrandColorSelection.royalBlue,
    toneBrightness: Brightness.light, // preset 1 tone
    mappingProfile: AppSemanticMappingProfiles.royalBlue,
    description: 'Light background + royal blue brand (from HTML).',
  );
}
