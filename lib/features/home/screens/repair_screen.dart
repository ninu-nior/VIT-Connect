import 'package:flutter/material.dart';

class RepairScreen extends StatelessWidget {
  const RepairScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    String? selectedOption;

    return Scaffold(
      appBar: AppBar(
        title: Text("Repairs"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: Image.asset("assets/images/repair.png"),
            ),
            SizedBox(height: 32),
            MyDropdownFormField(
              onChanged: (value) {
                selectedOption = value;
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle button press with selectedOption value
                if (selectedOption != null) {
                  print("Selected option: $selectedOption");
                  // Add your logic here to handle the selected option
                } else {
                  print("No option selected");
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDropdownFormField extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const MyDropdownFormField({Key? key, this.onChanged}) : super(key: key);

  @override
  _MyDropdownFormFieldState createState() => _MyDropdownFormFieldState();
}

class _MyDropdownFormFieldState extends State<MyDropdownFormField> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value!);
        }
      },
      items: [
        'AC Repair',
        'Fan Repair',
        'Light Repair',
        'Furniture Repair',
        'Other Electrical Repair'
      ].map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(
            option,
            style: TextStyle(fontSize: 12),
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Select an option',
        border: OutlineInputBorder(),
      ),
    );
  }
}
