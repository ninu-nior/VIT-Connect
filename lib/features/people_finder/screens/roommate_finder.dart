import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vit_connect_plus/features/people_finder/screens/roommate_users.dart';
import 'package:vit_connect_plus/utils/constants/api_endpoints.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';
import 'package:http/http.dart' as http;

class RoommateFinderScreen extends StatefulWidget {
  @override
  _RoommateFinderScreenState createState() => _RoommateFinderScreenState();
}

class _RoommateFinderScreenState extends State<RoommateFinderScreen> {
  String? selectedGender;
  String? selectedBlock;
  String? selectedRoomType;
  String? selectedACNAC;

  Future<List<Map<String, dynamic>>> sendPostRequest() async {
    final response = await http.post(
      Uri.parse(retrieveRoommates),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'block_name': selectedBlock!,
        'bed_type': selectedRoomType!,
        'room_type': selectedACNAC!,
      }),
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to send data');
    }
  }

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
                        onPressed: () async {
                          try {
                            final response = await sendPostRequest();
                            // Do something with the response
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RoommateUsersScreen(
                                          users: response,
                                        )));
                          } catch (e) {
                            print(e);
                          }
                          // Navigate back to the home page
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
