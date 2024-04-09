import 'package:flutter/material.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dark, required this.dividerText});
  final String dividerText;

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? MyColors.darkGrey : MyColors.grey,
            thickness: 0.5,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? MyColors.darkGrey : MyColors.grey,
            thickness: 0.5,
            endIndent: 5,
          ),
        )
      ],
    );
  }
}
