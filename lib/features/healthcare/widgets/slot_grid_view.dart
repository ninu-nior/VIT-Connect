import 'package:flutter/material.dart';

class SlotGridView extends StatelessWidget {
  const SlotGridView({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 80,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(0),
        itemCount: itemCount,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 0,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
