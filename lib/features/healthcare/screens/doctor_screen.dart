import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vit_connect_plus/features/healthcare/screens/health_care_screen.dart';
import 'package:vit_connect_plus/models/doctor.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constants/api_endpoints.dart';


class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);
  Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(Uri.parse(retreiveAllDoctors));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Doctor.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load doctors from API');
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: FutureBuilder<List<Doctor>>(
            future: fetchDoctors(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) => doctorInfoCard(
                    location: snapshot.data![index].venue,
                    imageUrl: snapshot.data![index].imageUrl,
                    index: index,
                    context: context, 
                    name: snapshot.data![index].name, 
                    qualification: snapshot.data![index].type,
                    doctorId: snapshot.data![index].doctorId
                  ),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

