import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/features/authentication/success_screen.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
                    "Verify your Email address!",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: Sizes.spacebtwitems,
                  ),
                  Text(
                    "support@email.com!",
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: Sizes.spaceBtwSections,
                  ),
                  Text(
                    "Congratulations! Your Account Awaits: Verfiy your email to start shopping and experience a world of unparallel deals and personalized offers",
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
                      onPressed: () => Get.to(() => SuccessScreen()),
                      child: Text("Continue"),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.spacebtwitems,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {}, child: Text("Resend Email")))
                ]),
          ),
        ),
      ),
    );
  }
}
