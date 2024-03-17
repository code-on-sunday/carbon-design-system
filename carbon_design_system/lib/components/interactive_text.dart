import 'package:flutter/material.dart';

class InteractiveText extends StatelessWidget {
  const InteractiveText(
    this.text, {
    required this.color,
    required this.states,
    required this.textStyle,
    Color? hoverColor,
    Color? activeColor,
    Color? disabledColor,
    super.key,
  })  : hoverColor = hoverColor ?? color,
        activeColor = activeColor ?? color,
        disabledColor = disabledColor ?? color;

  static Widget createWithMaterialStateController(
    String text, {
    required Color color,
    required TextStyle textStyle,
    required MaterialStatesController controller,
    Color? hoverColor,
    Color? activeColor,
    Color? disabledColor,
    Key? key,
  }) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) => InteractiveText(
        text,
        key: key,
        color: color,
        hoverColor: hoverColor ?? color,
        activeColor: activeColor ?? color,
        disabledColor: disabledColor ?? color,
        states: controller.value,
        textStyle: textStyle,
      ),
    );
  }

  final String text;
  final Color color;
  final Color hoverColor;
  final Color activeColor;
  final Color disabledColor;
  final Set<MaterialState> states;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle.copyWith(
        color: states.contains(MaterialState.disabled)
            ? disabledColor
            : states.contains(MaterialState.pressed)
                ? activeColor
                : states.contains(MaterialState.hovered)
                    ? hoverColor
                    : color,
      ),
    );
  }
}
