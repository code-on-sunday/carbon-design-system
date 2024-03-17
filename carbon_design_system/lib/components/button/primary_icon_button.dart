import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    required this.onTap,
    this.icon,
    super.key,
    this.size = ButtonSize.large,
  });

  final IconData? icon;
  final void Function()? onTap;
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.buttonPrimary,
      child: InkWell(
        hoverColor: context.colors.buttonPrimaryHover,
        highlightColor: context.colors.buttonPrimaryActive,
        onTap: onTap,
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Icon(
              icon,
              size: 16,
              color: context.colors.textOnColor,
            ),
          ),
        ),
      ),
    );
  }
}
