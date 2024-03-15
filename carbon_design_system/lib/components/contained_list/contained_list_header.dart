import 'package:carbon_design_system/carbon_design_system.dart';
import 'package:flutter/widgets.dart';

class ContainedListHeader extends StatelessWidget {
  const ContainedListHeader(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 32,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: context.colors.background,
          border: Border(
            bottom: BorderSide(
              color: context.colors.borderSubtle01,
            ),
          ),
        ),
        child: Text(
          title,
          style: context.headingCompact01
              .copyWith(color: context.colors.textPrimary),
        ),
      ),
    );
  }
}
