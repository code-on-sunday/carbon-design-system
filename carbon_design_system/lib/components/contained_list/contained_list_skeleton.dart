import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContainedListSkeleton extends StatelessWidget {
  const ContainedListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        5,
        (index) => Container(
          height: 24,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: context.colors.layerHover01,
          ),
          child: Container(
            color: context.colors.layerActive01,
          )
              .animate(
                onPlay: (controller) => controller.repeat(
                  reverse: true,
                ),
              )
              .scaleX(
                curve: Curves.easeInOut,
                begin: 0,
                end: 1,
                alignment: Alignment.centerLeft,
                duration: 0.5.seconds,
              )
              .then()
              .scaleX(
                curve: Curves.easeInOut,
                begin: 1,
                end: 0,
                alignment: Alignment.centerRight,
                duration: 0.5.seconds,
              ),
        ),
      ),
    );
  }
}
