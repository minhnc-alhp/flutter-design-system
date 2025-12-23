// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:paylance/app/app.dart';
import 'package:paylance/app/routing/app_router.dart';
import 'package:paylance/app/theme/theme_controller.dart';
import 'package:paylance/core/design_system/design_system.dart';

void _registerPalettePresets() {
  final r = ThemePaletteRegistry.instance;

  r.register(WhitePreset.preset);
  r.register(MilkWhitePreset.preset);
  r.register(DarkPreset.preset);
  r.register(SemiDarkPreset.preset);
  r.register(GrayPreset.preset);
  r.register(ForestNeonPreset.preset);
  r.register(PaperNeonPreset.preset);
  r.register(MidnightPreset.preset);
  r.register(GraphiteOrangePreset.preset);
  r.register(PaperLemonPreset.preset);
  r.register(OliveLemonPreset.preset);
  r.register(PaperRoyalBluePreset.preset);
  r.register(RoyalBluePreset.preset);
}

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Register palette presets (same as in bootstrap)
    _registerPalettePresets();

    // Create test instances
    final themeController = ThemeController();
    final router = const AppRouter();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      App(
        router: router,
        themeController: themeController,
        supportedLocales: const <Locale>[Locale('en')],
      ),
    );

    // Verify that the app builds without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
