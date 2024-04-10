import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/common/widgets/form_divider.dart';
import 'package:vit_connect_plus/common/widgets/rounded_image.dart';
import 'package:vit_connect_plus/features/healthcare/widgets/appointment_header.dart';
import 'package:vit_connect_plus/features/healthcare/widgets/slot_card.dart';
import 'package:vit_connect_plus/features/healthcare/widgets/slot_grid_view.dart';
import 'package:vit_connect_plus/features/home/screens/home_screen.dart';
import 'package:vit_connect_plus/features/lost_and_found/screens/lost_and_found_screen.dart';
import 'package:vit_connect_plus/models/slot.dart';
import 'package:vit_connect_plus/utils/constants/api_endpoints.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';
import 'package:http/http.dart' as http;

class DoctorAppointmentPage extends StatefulWidget {
  final String doctorName;
  final String venue;
  final String doctorId;
  final String imageUrl;
  final String type;
  DoctorAppointmentPage(
      {required this.doctorName,
      required this.venue,
      required this.doctorId,
      required this.imageUrl,
      required this.type});

  @override
  State<DoctorAppointmentPage> createState() => _DoctorAppointmentPageState();
}

class _DoctorAppointmentPageState extends State<DoctorAppointmentPage> {
  DateTime selectedDate = DateTime.now();

  int? selectedSlot;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> confirmAppointment() async {
    final Map<String, dynamic> requestData = {
      'doctor_id': widget.doctorId,
      'user_id': '8NSxj4wxemsOMyAG2jlR', // Replace with actual user name
      'date': selectedDate.day,
      'time': selectedSlot,
    };

    final response = await http.post(
      Uri.parse(bookAppointment), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      // Handle successful response
    } else {
      throw Exception('Failed to confirm appointment');
    }
  }

  Future<List<int>> fetchSlots(String doctorId, int date) async {
    final Map<String, dynamic> requestData = {
      'doctor_id': doctorId,
      'date': date.toString(),
    };

    final response = await http.post(
      Uri.parse(retreiverSlots),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      List<int> jsonResponse = List<int>.from(json.decode(response.body));

      return jsonResponse;
    } else {
      throw Exception('Failed to load slots from API');
    }
  }

  int? slotIndex = 0;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Book Appointment'),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderAndTabsAP(
                  type: widget.type,
                  dark: dark,
                  doctorName: widget.doctorName,
                  imageUrl: widget.imageUrl,
                  venue: widget.venue),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select a Date",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.grey.shade900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    OutlinedButton(
                        onPressed: () => _selectDate(context),
                        child: Icon(
                          Iconsax.calendar,
                          color: MyColors.darkerGrey,
                        )),
                    SizedBox(
                      height: Sizes.spacebtwitems,
                    ),
                    Text(
                      "Select a Preferred time slot",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.grey.shade900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FutureBuilder<List<int>>(
                      future: fetchSlots(widget.doctorId, selectedDate.day),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return SlotGridView(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => SlotCard(
                              slotIndex: snapshot.data![index],
                              onSelected: (selectedSlot) {
                                this.selectedSlot = selectedSlot;
                                print(this.selectedSlot);
                              },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: Sizes.spacebtwitems,
                    ),
                    Text(
                      "Reason for consultation",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.grey.shade900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "reason"),
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
                            await confirmAppointment();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentConfirmationPage(

                                        name:"User A",
                                        doctor: widget.doctorName,
                                        date: selectedDate.day.toString(),
                                        time: selectedSlot.toString(),
                                      )),
                            );
                          },
                          child: Text("Confirm Appointment")),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement appointment form fields here
    return Container(
      // Form fields
      child: Text('Appointment Form'),
    );
  }
}

class AppointmentConfirmationPage extends StatelessWidget {
  final String? name;
  final String? doctor;
  final String? reason="Therapy";
  final String? date;
  final String? time;

  AppointmentConfirmationPage({this.name, this.doctor, this.date, this.time});
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FormDivider(dark: dark, dividerText: "Confirmation Details"),
              SizedBox(
                height: 16,
              ),
              Text(
                "Name : $name",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.grey.shade900),
              ),
              Text(
                "Doctor : $doctor",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.grey.shade900),
              ),
              Text(
                "Reason : $reason",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.grey.shade900),
              ),
              Text(
                "Date : $date April 2024 ",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.grey.shade900),
              ),
              Text(
                "Time : $time:00",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.grey.shade900),
              ),
              SizedBox(
                height: 16,
              ),
              FormDivider(dark: dark, dividerText: ""),
              Text(
                'Appointment Booked Successfully!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to the home page
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
