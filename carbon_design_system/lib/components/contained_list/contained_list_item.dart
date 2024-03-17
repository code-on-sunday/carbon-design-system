import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';

class ContainedListItem extends StatelessWidget {
  const ContainedListItem({
    required this.child,
    super.key,
    this.onTap,
    this.isLast = false,
    this.isSelected = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool isLast;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 32,
      ),
      child: Material(
        color: isSelected ? context.colors.layerActive01 : Colors.transparent,
        child: InkWell(
          hoverColor: context.colors.layerHover01,
          highlightColor: context.colors.layerActive01,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: !isLast
                  ? Border(
                      bottom: BorderSide(
                        color: context.colors.borderSubtle01,
                      ),
                    )
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
