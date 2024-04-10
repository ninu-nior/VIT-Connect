import 'package:flutter/material.dart';

class CarPoolUsersScreen extends StatefulWidget {
  final List<dynamic> users;

  const CarPoolUsersScreen({super.key, required this.users});

  @override
  State<CarPoolUsersScreen> createState() => _CarPoolUsersState();
}

class _CarPoolUsersState extends State<CarPoolUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Pool Users'),
      ),
      body: ListView.builder(
        itemCount: widget.users.length,
        itemBuilder: (context, index) {
          return UserTile(
            userName: widget.users[index]['name'],
            contactNumber: widget.users[index]['contact_no'].toString(),
            time: widget.users[index]['time'].toString(),
          );
        },
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String userName;
  final String contactNumber;
  final String time;
  UserTile(
      {required this.userName,
      required this.contactNumber,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Name: $userName",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
           "Contact: $contactNumber",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Time Of Leaving: $time : 00",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
