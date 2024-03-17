import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';

class GhostIconButton extends StatelessWidget {
  const GhostIconButton({
    required this.icon,
    this.isActive = false,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final void Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: context.colors.backgroundHover,
        highlightColor: context.colors.backgroundActive,
        onTap: onTap,
        child: SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              icon,
              size: 16,
              color: isActive
                  ? context.colors.buttonTertiaryHover
                  : context.colors.iconPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
