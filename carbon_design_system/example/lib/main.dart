import 'package:flutter/material.dart';

import 'package:carbon_design_system/carbon_design_system.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CDSThemeColorsProvider(
        themeColors: const WhiteThemeColors(),
        child: Builder(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text(
                'Hello World!',
                style: context.body01.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
