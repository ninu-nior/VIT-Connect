import 'package:flutter/material.dart';
import 'package:vit_connect_plus/common/widgets/appbar.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';

class HCAppBar extends StatelessWidget {
  const HCAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hello Juhi,",
            style: TextStyle(color: MyColors.lightGrey),
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
