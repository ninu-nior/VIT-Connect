import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vit_connect_plus/common/widgets/rounded_image.dart';
import 'package:vit_connect_plus/features/healthcare/screens/doctor_screen.dart';
import 'package:vit_connect_plus/features/healthcare/screens/medicine_screen.dart';
import 'package:vit_connect_plus/features/healthcare/widgets/header.dart';
import 'package:vit_connect_plus/features/lost_and_found/screens/lost_and_found_screen.dart';
import 'package:vit_connect_plus/models/appointment.dart';
import 'package:vit_connect_plus/utils/constants/api_endpoints.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';
import 'package:vit_connect_plus/features/healthcare/controllers/appointment_controller.dart';

class HealthCareScreen extends StatelessWidget {
  const HealthCareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 3, // Define the number of tabs
      child: Scaffold(
        body: Column(
          children: [
            HeaderAndTabs(dark: dark),
            Expanded(
              child: TabBarView(
                children: [
                  // Sample text for Doctors tab
                  DoctorScreen(),
                  // Sample text for Medicines tab
                  MedicineScreen(),
                  // Sample text for History tab
                  HistoryScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget? doctorInfoCard({
  required BuildContext context,
  required int index,
  String name = "John Doe",
  String doctorId = "hrthrhe",
  String qualification = "MBBS|MD (Physician)",
  String location = "HealthCentre, Ground Floor",
  required String imageUrl,
  Color? backgroundColor,
  Color? buttonColor,
}) {
  backgroundColor = backgroundColor ?? MyColors.primary.withOpacity(0.7);
  buttonColor = buttonColor ?? MyColors.primary.withOpacity(0.4);
  final appointmentController = Get.put(AppointmentController());

  return Padding(
    padding: EdgeInsets.only(bottom: 18.0),
    child: RoundedContainer(
      height: 190,
      width: double.infinity,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: Image.network(imageUrl).image,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: MyColors.light,
                          fontSizeDelta: 2,
                        ),
                  ),
                  Text(
                    qualification,
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: MyColors.light,
                          fontSizeDelta: 0.5,
                        ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: MyColors.light,
                          fontSizeDelta: 0.5,
                        ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          buttonColor,
                        ),
                      ),
                      onPressed: () {
                        appointmentController.goToBookAppointment(
                            name, qualification, location, imageUrl, doctorId);
                      },
                      child: Text(
                        "Check Availability",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  Future<List<Appointment>> fetchAppointments(String userId) async {
    final response = await http.post(
      Uri.parse(retreiveAppointments), // Replace with your API URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'user_id': userId}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> appointmentsJson = json.decode(response.body);
      return appointmentsJson
          .map((json) => Appointment.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dummy data
    return FutureBuilder<List<Appointment>>(
      future: fetchAppointments(
          '8NSxj4wxemsOMyAG2jlR'), // Replace 'user_id' with the actual user ID
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Transform.scale(
              scale:
                  0.5, // Adjust this value to change the size of the CircularProgressIndicator
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final appointment = snapshot.data![index];
              return AppointmentCard(appointment: appointment);
            },
          );
        }
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Doctor Name: ${appointment.doctorName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'User Name: ${appointment.userName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Appointment Time: ${appointment.time}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Day: ${appointment.date}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
