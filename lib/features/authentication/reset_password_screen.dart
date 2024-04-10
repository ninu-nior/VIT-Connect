import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cupertinoIcons = CupertinoIcons;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image(
                  //   width: HelperFunctions.screenWidth() * 0.60,
                  //   image: AssetImage(
                  //       //image
                  //       "assets/images/on_boarding_images/sammy-line-man-and-dog-delivering-packages-on-a-moped.gif"),
                  // ),
                  //title and subtitle
                  Text(
                    "Password Reset Email Sent",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: Sizes.spacebtwitems,
                  ),

                  Text(
                    "Your Account Security is our Priority! We've sent you a secure link to safely change your password and keep your account protected",
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Sizes.spaceBtwSections,
                  ),
                  //buttons, continue and resent email
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Done"),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
