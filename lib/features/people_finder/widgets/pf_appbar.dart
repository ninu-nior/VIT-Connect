import 'package:flutter/material.dart';
import 'package:vit_connect_plus/common/widgets/appbar.dart';
import 'package:vit_connect_plus/features/home/screens/home_screen.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';

class PFAppBar extends StatelessWidget {
  PFAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Hello Juhi,",
          style: TextStyle(color: MyColors.darkerGrey),
        ),
        const Text(
          "looking for people?",
          style: TextStyle(color: MyColors.darkerGrey, fontSize: 24),
        ),
        const SizedBox(
          height: 6,
        ),
      ]),
    );
  }
}
