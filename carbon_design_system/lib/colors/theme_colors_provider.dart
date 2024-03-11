// ignore_for_file: public_member_api_docs

import 'package:carbon_design_system/colors/theme_colors.dart';
import 'package:flutter/material.dart';

class CDSThemeColorsProvider extends InheritedWidget {
  const CDSThemeColorsProvider({
    required this.themeColors,
    required super.child,
    super.key,
  });

  final CDSThemeColors themeColors;

  static CDSThemeColors of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<CDSThemeColorsProvider>();
    assert(provider != null, 'No CDSThemeColorsProvider found in context');
    return provider!.themeColors;
  }

  @override
  bool updateShouldNotify(CDSThemeColorsProvider oldWidget) {
    return themeColors != oldWidget.themeColors;
  }
}

extension GetThemeColors on BuildContext {
  CDSThemeColors get colors => CDSThemeColorsProvider.of(this);
}
