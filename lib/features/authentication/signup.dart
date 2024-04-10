import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/common/widgets/form_divider.dart';
import 'package:vit_connect_plus/features/authentication/verify_email_screen.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      //we want our design to be scrollable on small devices
      body: SingleChildScrollView(
        //we need to add default space around everything
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //signup title
              Text("Let's Create and Account for you",
                  style: Theme.of(context).textTheme.headlineMedium),
              //space between title and form
              SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              //form
              SignupForm(dark: dark),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              //divider

              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      //elements in form are arranged vertically
      child: Column(
        children: [
          //first is name and last name in a row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(
                width: Sizes.spacebtwitems,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Sizes.spacebtwitems,
          ),
          //username

          //email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: Sizes.spacebtwitems,
          ),
          //phone
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: "Phone", prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: Sizes.spacebtwitems,
          ),
          //password
          TextFormField(
            obscureText: true,
            expands: false,
            decoration: const InputDecoration(
                labelText: "password",
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(
            height: Sizes.spacebtwitems,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: "Room Number",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(
                width: Sizes.spacebtwitems,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: "Block",
                    prefixIcon: Icon(Iconsax.building),
                  ),
                ),
              ),
              SizedBox(
                width: Sizes.spacebtwitems,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: "Mess",
                    prefixIcon: Icon(Iconsax.add),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: Sizes.spacebtwitems,
          ),

          //terms and conditions checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {}),
              ),
              const SizedBox(
                width: Sizes.spacebtwitems,
              ),
              //we need to add variations in text for that we use text.rich property and add text span in it
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "I agree to",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: " Privacy Policy ",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? MyColors.white : MyColors.primary)),
                    TextSpan(
                        text: "and",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: " Terms of use ",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? MyColors.white : MyColors.primary)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Sizes.spaceBtwSections,
          ),
          //signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => VerifyEmailScreen()),
                child: Text("Create Account")),
          ),
        ],
      ),
    );
  }
}
