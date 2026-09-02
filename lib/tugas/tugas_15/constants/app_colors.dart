import 'package:flutter/material.dart';

abstract class AppColors {
  // Surface Tiers
  static const Color surface = Color(0xFF131313);
  static const Color surfaceDim = Color(0xFF131313);
  static const Color surfaceBright = Color(0xFF3A3939);
  static const Color surfaceContainerLowest = Color(0xFF0E0E0E);
  static const Color surfaceContainerLow = Color(0xFF1C1B1B);
  static const Color surfaceContainer = Color(0xFF201F1F);
  static const Color surfaceContainerHigh = Color(0xFF2A2A2A);
  static const Color surfaceContainerHighest = Color(0xFF353534);
  static const Color surfaceVariant = Color(0xFF353534);

  // Surface Text & Contrast
  static const Color onSurface = Color(0xFFE5E2E1);
  static const Color onSurfaceVariant = Color(0xFFE0C0AF);
  static const Color inverseSurface = Color(0xFFE5E2E1);
  static const Color inverseOnSurface = Color(0xFF313030);

  // Outlines & Borders
  static const Color outline = Color(0xFFA78B7C);
  static const Color outlineVariant = Color(0xFF584235);
  static const Color ghostBorder = Color(
    0x1AFFFFFF,
  ); // Ghost border 10% opacity

  // Surface Tint
  static const Color surfaceTint = Color(0xFFFFB68B);

  // Primary (Vibrant Warm Orange Palette)
  static const Color primary = Color(0xFFFFB68B);
  static const Color onPrimary = Color(0xFF522300);
  static const Color primaryContainer = Color(
    0xFFFF7A00,
  ); // Main CTA button fill
  static const Color onPrimaryContainer = Color(0xFF5C2800);
  static const Color inversePrimary = Color(0xFF994700);

  // Primary Fixed
  static const Color primaryFixed = Color(0xFFFFDBC8);
  static const Color primaryFixedDim = Color(0xFFFFB68B);
  static const Color onPrimaryFixed = Color(0xFF321200);
  static const Color onPrimaryFixedVariant = Color(0xFF753400);

  // Secondary (Warm Amber / Nutrition Accents)
  static const Color secondary = Color(0xFFFFBA48);
  static const Color onSecondary = Color(0xFF442B00);
  static const Color secondaryContainer = Color(0xFFE69D00);
  static const Color onSecondaryContainer = Color(0xFF583900);

  // Secondary Fixed
  static const Color secondaryFixed = Color(0xFFFFDDB1);
  static const Color secondaryFixedDim = Color(0xFFFFBA48);
  static const Color onSecondaryFixed = Color(0xFF291800);
  static const Color onSecondaryFixedVariant = Color(0xFF614000);

  // Tertiary (Muted Metallic / Subtle Grey)
  static const Color tertiary = Color(0xFFC8C6C5);
  static const Color onTertiary = Color(0xFF313030);
  static const Color tertiaryContainer = Color(0xFFA2A0A0);
  static const Color onTertiaryContainer = Color(0xFF373737);

  // Tertiary Fixed
  static const Color tertiaryFixed = Color(0xFFE5E2E1);
  static const Color tertiaryFixedDim = Color(0xFFC8C6C5);
  static const Color onTertiaryFixed = Color(0xFF1C1B1B);
  static const Color onTertiaryFixedVariant = Color(0xFF474746);

  // Error Palette
  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  // Canvas / Background
  static const Color background = Color(0xFF131313);
  static const Color onBackground = Color(0xFFE5E2E1);

  // Depth Layers & Overlay Helpers
  static const Color canvasBase = Color(0xFF050505);
  static const Color cardSurface = Color(0xFF121212);
  static const Color overlaySurface = Color(0xFF1A1A1A);
  static const Color navBlurBackground = Color(
    0xB31C1B1B,
  ); // 70% opacity charcoal
}
