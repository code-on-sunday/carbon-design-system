import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    required this.text,
    required this.onTap,
    required this.materialStatesController,
    this.icon,
    super.key,
  });

  static Widget create({
    required String text,
    IconData? icon,
    void Function()? onTap,
  }) {
    return ChangeNotifierProvider(
      create: (_) => MaterialStatesController(),
      child: Builder(
        builder: (context) {
          return TertiaryButton(
            text: text,
            icon: icon,
            onTap: onTap,
            materialStatesController: context.read(),
          );
        },
      ),
    );
  }

  final String text;
  final IconData? icon;
  final void Function()? onTap;
  final MaterialStatesController materialStatesController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.colors.buttonTertiary,
        ),
      ),
      child: InkWell(
        hoverColor: context.colors.buttonTertiaryHover,
        highlightColor: context.colors.buttonTertiaryActive,
        statesController: materialStatesController,
        onTap: onTap,
        child: SizedBox(
          height: 32,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InteractiveText.createWithMaterialStateController(
                  text,
                  controller: materialStatesController,
                  color: context.colors.buttonTertiary,
                  hoverColor: context.colors.textInverse,
                  activeColor: context.colors.textInverse,
                  disabledColor: context.colors.textDisabled,
                  textStyle: context.bodyCompact01,
                ),
                (switch (icon) {
                  null => const SizedBox(width: 64),
                  _ => Padding(
                      padding: const EdgeInsets.only(left: 32, right: 16),
                      child: InteractiveIcon.createWithMaterialStateController(
                        icon!,
                        size: 16,
                        controller: materialStatesController,
                        color: context.colors.buttonTertiary,
                        hoverColor: context.colors.iconInverse,
                        activeColor: context.colors.iconInverse,
                        disabledColor: context.colors.iconDisabled,
                      ),
                    )
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
