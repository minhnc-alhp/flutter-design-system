// Graphite + Warm Orange preset (dark tone).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';

@immutable
final class GraphiteOrangePreset {
  const GraphiteOrangePreset._();

  static const PalettePreset preset = PalettePreset(
    id: 'graphiteOrange',
    displayName: 'Graphite Orange',
    palettes: PrimitivePalettes.graphiteOrange,
    brand: BrandColorSelection.warmOrange,
    toneBrightness: Brightness.dark, // preset 1 tone
    mappingProfile: AppSemanticMappingProfiles.graphiteOrange,
    description: 'Graphite dark background with warm orange brand (from HTML).',
  );
}
