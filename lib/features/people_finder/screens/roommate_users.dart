import 'package:flutter/material.dart';

class RoommateUsersScreen extends StatefulWidget {
  final List<dynamic> users;

  const RoommateUsersScreen({super.key, required this.users});

  @override
  State<RoommateUsersScreen> createState() => _RoommateUsersState();
}

class _RoommateUsersState extends State<RoommateUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available People'),
      ),
      body: ListView.builder(
        itemCount: widget.users.length,
        itemBuilder: (context, index) {
          return UserTile(
            blockName: widget.users[index]['block_name'],
            userName: widget.users[index]['user_name'],
            roomType: widget.users[index]['room_type'].toString(),
            bedType: widget.users[index]['bed_type'].toString(),
          );
        },
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String userName;
  final String roomType;
  final String bedType;
  final String blockName;
  UserTile(
      {required this.userName,
      required this.blockName,
      required this.roomType,
      required this.bedType});

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
           "Room: $bedType $roomType in $blockName block",
              style: TextStyle(fontSize: 16),
            ),
            // SizedBox(height: 10),
            // Text(
            //   "Room Type: $roomType",
            //   style: TextStyle(fontSize: 16, color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }
}
