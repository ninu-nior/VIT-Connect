import 'package:flutter/material.dart';
import 'package:vit_connect_plus/common/widgets/rounded_container.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';

class Mon extends StatelessWidget {
  const Mon(
      {super.key,
      required this.breakfast,
      required this.lunch,
      required this.snacks,
      required this.dinner});
  final String breakfast;
  final String lunch;
  final String snacks;
  final String dinner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Text(
                "Breakfast",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: MyColors.darkerGrey),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RoundedContainer(
                  backgroundColor: MyColors.primary.withOpacity(0.15),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text(breakfast),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Lunch",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: MyColors.darkerGrey),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RoundedContainer(
                  backgroundColor: MyColors.primary.withOpacity(0.15),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text(lunch),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Snacks",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: MyColors.darkerGrey),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RoundedContainer(
                  width: double.infinity,
                  backgroundColor: MyColors.primary.withOpacity(0.15),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text(snacks),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Dinner",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: MyColors.darkerGrey),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RoundedContainer(
                  backgroundColor: MyColors.primary.withOpacity(0.15),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text(dinner),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
