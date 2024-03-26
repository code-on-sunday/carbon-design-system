import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';

class StandaloneLink extends StatefulWidget {
  const StandaloneLink({required this.text, super.key, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  State<StandaloneLink> createState() => _StandaloneLinkState();
}

class _StandaloneLinkState extends State<StandaloneLink> {
  final statesController = MaterialStatesController();

  @override
  void dispose() {
    statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: statesController,
      builder: (context, _) => MouseRegion(
        onEnter: (_) => statesController.update(MaterialState.hovered, true),
        onExit: (_) => statesController.update(MaterialState.hovered, false),
        child: GestureDetector(
          onTap: widget.onTap,
          onTapDown: (_) =>
              statesController.update(MaterialState.pressed, true),
          onTapUp: (_) => statesController.update(MaterialState.pressed, false),
          onTapCancel: () =>
              statesController.update(MaterialState.pressed, false),
          onDoubleTapDown: (_) =>
              statesController.update(MaterialState.pressed, true),
          onDoubleTapCancel: () =>
              statesController.update(MaterialState.pressed, false),
          child: InteractiveText.createWithMaterialStateController(
            widget.text,
            controller: statesController,
            color: context.colors.linkPrimary,
            hoverColor: context.colors.linkPrimaryHover,
            activeColor: context.colors.textPrimary,
            disabledColor: context.colors.textDisabled,
            textStyle: context.bodyCompact01,
          ),
        ),
      ),
    );
  }
}
