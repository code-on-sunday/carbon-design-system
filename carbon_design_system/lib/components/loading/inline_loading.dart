import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/material.dart';

class InlineLoading extends StatelessWidget {
  const InlineLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        backgroundColor: context.colors.borderSubtle01,
        color: context.colors.borderInteractive,
        strokeWidth: 3.5,
      ),
    );
  }
}
