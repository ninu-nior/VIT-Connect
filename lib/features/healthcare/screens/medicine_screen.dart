import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/common/widgets/form_divider.dart';
import 'package:vit_connect_plus/features/lost_and_found/screens/lost_and_found_screen.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class MedicalStoreContactData {
  final String name;
  final String phoneNumber;

  MedicalStoreContactData(this.name, this.phoneNumber);
}

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    // Generate sample medicine data
    final List<String> medicineNames = [
      'Medicine 1',
      'Medicine 2',
      'Medicine 3',
      // Add more medicine names as needed
    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MedicalStores(
                contacts: [
                  MedicalStoreContactData("Meeanakshi Medicals", "76766767676"),
                  MedicalStoreContactData("Apollo Pharmacy ", "1234567890"),
                  MedicalStoreContactData("Meenakshi Medicals", "76766767676"),
                ],
              ),
              SizedBox(height: Sizes.spaceBtwSections / 2),
              FormDivider(dark: dark, dividerText: "Medicine Directory"),
              SizedBox(height: Sizes.spaceBtwSections / 2),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.search_status),
                    labelText: "search medicines"),
              ),
              SizedBox(height: Sizes.spacebtwitems / 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: medicineNames.length,
                itemBuilder: (_, index) {
                  return MedicineCard(name: medicineNames[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedContainer(
          backgroundColor: Colors.grey.shade50,
          radius: 8,
          height: 60,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Iconsax.tick_square),
                SizedBox(
                  width: Sizes.spacebtwitems,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(name), Text("distributer/company")],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}

class MedicalStores extends StatelessWidget {
  MedicalStores({
    Key? key,
    required this.contacts,
  }) : super(key: key);

  final List<MedicalStoreContactData> contacts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: contacts.length,
          itemBuilder: (_, index) {
            final contact = contacts[index];
            return MedicalStoreContact(
              name: contact.name,
              number: contact.phoneNumber,
            );
          },
        ),
      ),
    );
  }
}

class MedicalStoreContact extends StatelessWidget {
  const MedicalStoreContact({
    Key? key,
    required this.name,
    required this.number,
  }) : super(key: key);

  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedContainer(
          padding: EdgeInsets.all(16),
          height: 120,
          width: 180,
          showBorder: true,
          backgroundColor: MyColors.lightContainer,
          borderColor: MyColors.grey,
          child: Column(
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: MyColors.darkerGrey),
              ),
              SizedBox(height: Sizes.spacebtwitems),
              Row(
                children: [
                  Icon(
                    Iconsax.call5,
                    size: 24,
                  ),
                  SizedBox(
                    width: Sizes.spacebtwitems / 2,
                  ),
                  Text(
                    number,
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: Sizes.spacebtwitems,
        )
      ],
    );
  }
}