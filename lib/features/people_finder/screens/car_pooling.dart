import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class CarPoolingScreen extends StatefulWidget {
  @override
  _CarPoolingScreenState createState() => _CarPoolingScreenState();
}

class _CarPoolingScreenState extends State<CarPoolingScreen> {
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  Future<void> _selectFromTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        fromTime = picked;
      });
      //print('From Time: ${picked.hour}:${picked.minute}');
    }
  }

  Future<void> _selectToTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        toTime = picked;
      });
      //print('To Time: ${picked.hour}:${picked.minute}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Pooling Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/taxi.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Looking to Share a ride ?",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  Text(
                    "Between",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () => _selectFromTime(context),
                        child: Icon(Iconsax.clock),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      fromTime != null
                          ? Text(
                              '${fromTime!.hour}:${fromTime!.minute}',
                              style: TextStyle(fontSize: 20),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "To",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () => _selectToTime(context),
                        child: Icon(Iconsax.clock),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      toTime != null
                          ? Text(
                              '${toTime!.hour}:${toTime!.minute}',
                              style: TextStyle(fontSize: 20),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration:
                        InputDecoration(prefixIcon: Icon(Iconsax.location)),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) {
                              // Return the color based on the button state
                              if (states.contains(MaterialState.pressed)) {
                                // Color when the button is pressed
                                return MyColors.primary.withOpacity(0.7);
                              } else {
                                // Default color
                                return MyColors.primary.withOpacity(0.9);
                              }
                            },
                          ),
                        ),
                        onPressed: () {
                          // Navigate back to the home page
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text("Search for people")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
