import 'package:flutter/material.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class RoommateFinderScreen extends StatefulWidget {
  @override
  _RoommateFinderScreenState createState() => _RoommateFinderScreenState();
}

class _RoommateFinderScreenState extends State<RoommateFinderScreen> {
  String? selectedGender;
  String? selectedBlock;
  String? selectedRoomType;
  String? selectedACNAC;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Roommates'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/people.jpg"),
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
                    "Looking for a Roommate ?",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    items: ['Male', 'Female']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(
                                gender,
                                style: TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedBlock,
                    onChanged: (value) {
                      setState(() {
                        selectedBlock = value;
                      });
                    },
                    items: ['A', 'B', 'C', 'D1', 'D2']
                        .map((block) => DropdownMenuItem(
                              value: block,
                              child: Text(
                                block,
                                style: TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Block',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedRoomType,
                    onChanged: (value) {
                      setState(() {
                        selectedRoomType = value;
                      });
                    },
                    items: ['2', '3', '4', '5', '6']
                        .map((roomType) => DropdownMenuItem(
                              value: roomType,
                              child: Text(
                                "$roomType bed",
                                style: TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Room Type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedACNAC,
                    onChanged: (value) {
                      setState(() {
                        selectedACNAC = value;
                      });
                    },
                    items: ['AC', 'NAC']
                        .map((acnac) => DropdownMenuItem(
                              value: acnac,
                              child: Text(
                                acnac,
                                style: TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'AC/NAC',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
