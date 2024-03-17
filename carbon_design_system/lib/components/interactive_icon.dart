import 'package:flutter/material.dart';

class InteractiveIcon extends StatelessWidget {
  const InteractiveIcon(
    this.icon, {
    required this.color,
    required this.states,
    super.key,
    this.size,
    Color? hoverColor,
    Color? activeColor,
    Color? disabledColor,
  })  : hoverColor = hoverColor ?? color,
        activeColor = activeColor ?? color,
        disabledColor = disabledColor ?? color;

  static Widget createWithMaterialStateController(
    IconData icon, {
    required Color color,
    required MaterialStatesController controller,
    double? size,
    Color? hoverColor,
    Color? activeColor,
    Color? disabledColor,
    Key? key,
  }) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) => InteractiveIcon(
        icon,
        key: key,
        size: size,
        color: color,
        hoverColor: hoverColor ?? color,
        activeColor: activeColor ?? color,
        disabledColor: disabledColor ?? color,
        states: controller.value,
      ),
    );
  }

  final IconData icon;
  final double? size;
  final Color color;
  final Color hoverColor;
  final Color activeColor;
  final Color disabledColor;
  final Set<MaterialState> states;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: states.contains(MaterialState.disabled)
          ? disabledColor
          : states.contains(MaterialState.pressed)
              ? activeColor
              : states.contains(MaterialState.hovered)
                  ? hoverColor
                  : color,
    );
  }
}
