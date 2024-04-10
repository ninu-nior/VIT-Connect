import 'package:flutter/material.dart';

class RepairScreen extends StatefulWidget {
  const RepairScreen({Key? key});

  @override
  _RepairScreenState createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  String? selectedOption;
  List<Map<String, dynamic>> selectedOptionsList = []; // Corrected declaration

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    setState(() {
                      selectedOptionsList.add({
                        'category': selectedOption!,
                        'fixed': false,
                      });
                      selectedOption =
                          null; // Clear selectedOption after adding
                    });
                  }
                },
                child: Text("Add to List"),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Selected Options:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: selectedOptionsList
                  .asMap()
                  .entries
                  .map((entry) => RepairCard(
                        category: entry.value['category'],
                        fixed: entry.value['fixed'],
                        onTap: () {
                          setState(() {
                            selectedOptionsList[entry.key]['fixed'] =
                                !entry.value['fixed'];
                          });
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class RepairCard extends StatelessWidget {
  final String category;
  final bool? fixed;
  final VoidCallback onTap;

  const RepairCard({
    required this.category,
    required this.fixed,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(category),
        trailing: IconButton(
          icon: Icon(
            fixed! ? Icons.check_circle : Icons.radio_button_unchecked,
            color: fixed! ? Colors.green : Colors.blue,
          ),
          onPressed: onTap,
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
