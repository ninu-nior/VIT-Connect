import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/features/authentication/reset_password_screen.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            textAlign: TextAlign.start,
            "Forget  Password",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: Sizes.spacebtwitems),
          Text(
              "Don't worry sometimes people can forget too, enter your email and we will send you a password reset link."),
          SizedBox(
            height: Sizes.spaceBtwSections,
          ),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: "E-Mail"),
          ),
          SizedBox(
            height: Sizes.spaceBtwSections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => ResetPasswordScreen()),
                  child: Text("Submit")))
        ]),
      ),
    );
  }
}
