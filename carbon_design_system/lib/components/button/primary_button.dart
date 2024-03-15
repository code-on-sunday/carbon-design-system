import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onTap,
    this.icon,
    super.key,
  });

  final String text;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.buttonPrimary,
      child: InkWell(
        hoverColor: context.colors.buttonPrimaryHover,
        highlightColor: context.colors.buttonPrimaryActive,
        onTap: onTap,
        child: SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: context.bodyCompact01.copyWith(
                    color: context.colors.textOnColor,
                  ),
                ),
                (switch (icon) {
                  null => const SizedBox(width: 64),
                  _ => Padding(
                      padding: const EdgeInsets.only(left: 32, right: 16),
                      child: Icon(
                        icon,
                        size: 16,
                        color: context.colors.textOnColor,
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
