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

class DeclarativeContainer extends StatelessWidget {
  const DeclarativeContainer(
      {super.key,
      this.constraints,
      this.alignment,
      this.padding,
      this.color,
      this.child});

  final BoxConstraints? constraints;
  final Alignment? alignment;
  final EdgeInsets? padding;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ConditionalExpressionWidget(
      condition: color != null,
      whenTrue: ColoredBox(
        color: color!,
        child: _anonymousLevel1,
      ),
      whenFalse: _anonymousLevel1,
    );
  }

  Widget get _anonymousLevel1 => ConditionalExpressionWidget(
        condition: padding != null,
        whenTrue: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _anonymousLevel2,
        ),
        whenFalse: _anonymousLevel2,
      );

  Widget get _anonymousLevel2 => ConditionalExpressionWidget(
        condition:
            child == null && (constraints == null || !constraints!.isTight),
        whenTrue: LimitedBox(
          maxWidth: 0,
          maxHeight: 0,
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
          ),
        ),
        whenFalse: ConditionalExpressionWidget(
          condition: alignment != null,
          whenTrue: Align(
            alignment: alignment!,
          ),
        ),
      );
}

class ConditionalExpressionWidget extends StatelessWidget {
  const ConditionalExpressionWidget(
      {super.key, required this.condition, this.whenTrue, this.whenFalse});

  final bool condition;
  final Widget? whenTrue;
  final Widget? whenFalse;

  @override
  Widget build(BuildContext context) {
    return condition ? whenTrue! : whenFalse!;
  }
}
