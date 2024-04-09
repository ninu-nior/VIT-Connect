import 'package:flutter/material.dart';

class FoundGridView extends StatelessWidget {
  const FoundGridView({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 316,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
