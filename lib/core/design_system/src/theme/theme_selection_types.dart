// core/design_system/src/theme/theme_selection_types.dart
//
// Theme selection primitives shared by apps.
// - "presetBased" = app chọn 1 palette preset (preset tự chứa tone + palette).
// - "brandBased" là tên legacy (trước đây), giữ lại để đọc config/json cũ.

library;

enum ThemeSelectionType {
  systemBased,

  /// Palette preset mode.
  presetBased,

  /// Legacy name. Kept for backward compatibility only.
  @Deprecated('Use ThemeSelectionType.presetBased')
  brandBased,
}

/// Stable slots used by apps to map to a concrete PalettePreset ID.
/// Persist slots (defaultLight/defaultDark) so changing app defaults is trivial.
@Deprecated(
  'ToneSlot is legacy. Prefer ThemeDefaults mapping or persist presetId.',
)
enum ToneSlot { defaultLight, defaultDark }
