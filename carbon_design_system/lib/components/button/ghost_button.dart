import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';

class GhostButton extends StatelessWidget {
  const GhostButton({
    required this.text,
    super.key,
    this.onTap,
    this.size = ButtonSize.large,
  });

  final String text;
  final void Function()? onTap;
  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: context.colors.backgroundHover,
        highlightColor: context.colors.backgroundActive,
        onTap: onTap,
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: context.bodyCompact01.copyWith(
                    color: context.colors.linkPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
