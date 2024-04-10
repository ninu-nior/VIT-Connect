import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/common/widgets/form_divider.dart';
import 'package:vit_connect_plus/features/authentication/forget_password.dart';
import 'package:vit_connect_plus/features/authentication/signup.dart';
import 'package:vit_connect_plus/features/home/screens/home_screen.dart';
import 'package:vit_connect_plus/navigation_menu.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: Sizes.appBarHeight,
    bottom: Sizes.defaultSpace,
    left: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
  );
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      //since we want to make our design scrollable for smaller screens
      body: SingleChildScrollView(
          //first thing, add spacing around the screen
          child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        //   top: TSizes.appBarHeight,
        //   bottom: TSizes.defaultSpace,
        //   left: TSizes.defaultSpace,
        //   right: TSizes.defaultSpace,
        child: Column(
          children: [
            LoginHeader(dark: dark),
            //form
            LoginForm(),

            SizedBox(
              height: Sizes.md,
            ),
          ],
        ),
      )),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwSections),
      child: Form(
        child: Column(
          children: [
            //email
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(height: Sizes.spacebtwitems),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: Sizes.spacebtwitems / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Checkbox(value: true, onChanged: (value) {}),
                const Text("Remember me"),
                TextButton(
                    onPressed: () => Get.to(() => ForgetPasswordScreen()),
                    child: Text("Forgot password?"))
              ],
            ),
            const SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            //sign in button
            //to make this button full width
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => NavigationMenu()),
                child: Text("Sign In_"),
              ),
            ),
            const SizedBox(
              height: Sizes.spacebtwitems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text("Create Account?"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.spacebtwitems),
      child: Column(
          //we are gonnna align this to the left side
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //logo title and sub title
            Image(
              height: 150,
              image: AssetImage(
                  dark ? "assets/images/logo.png" : "assets/images/logo.png"),
            ),
            // Text(
            //   "Welcome back,",
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            SizedBox(height: Sizes.sm),
            SizedBox(height: Sizes.sm),
            Text(
              "Discover Limitless choices and Unmatched Convenience",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ]),
    );
  }
}
