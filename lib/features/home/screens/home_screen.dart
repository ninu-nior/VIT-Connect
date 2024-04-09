import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/common/widgets/appbar.dart';
import 'package:vit_connect_plus/common/widgets/circular_container.dart';
import 'package:vit_connect_plus/features/home/screens/laundry_screen.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedRepair;
  List<String> repairHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(
                repairHistory: repairHistory,
                onCompleted: (index) {
                  setState(() {});
                }),
            Container(
              color: MyColors.lightContainer,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      "Need Room Repairs ?",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(children: [Container()],),
                    Row(
                      children: [
                        Container(
                          width: 300,
                          child: DropdownButtonFormField<String>(
                            value: selectedRepair,
                            onChanged: (value) {
                              setState(() {
                                selectedRepair = value;
                              });
                            },
                            items: [
                              'AC Repair',
                              'Fan Repair',
                              'Light Repair',
                              'Table Light Repair',
                              'Other Electrical',
                              'Furniture Repair'
                            ]
                                .map((repair) => DropdownMenuItem(
                                      value: repair,
                                      child: Text(
                                        repair,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ))
                                .toList(),
                            decoration: InputDecoration(
                              labelText: 'Select Repair Type',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (selectedRepair != null) {
                                setState(() {
                                  repairHistory.add(selectedRepair!);
                                });
                              }
                            },
                            child: Icon(Iconsax.tick_square),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: MyColors.success.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: MyColors.darkerGrey),
                    ),
                    ElevatedButton((){}
                      
                      child: Text("Check Days"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LaundryScreen()),
//                         );
//                       },

class HomeAppBar extends StatelessWidget {
  final List<String> repairHistory;
  final Function(int) onCompleted;

  const HomeAppBar({
    required this.repairHistory,
    required this.onCompleted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back,",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: const Color.fromRGBO(158, 158, 158, 1)),
          ),
          SizedBox(height: 4),
          Text(
            "Juhi Mantri",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: MyColors.darkerGrey),
          ),
        ],
      ),
      actions: [
        PopupMenuButton<int>(
          itemBuilder: (BuildContext context) {
            if (repairHistory.isEmpty) {
              return [
                PopupMenuItem<int>(
                  child: Text('No repair history'),
                ),
              ];
            }
            return List.generate(repairHistory.length, (index) {
              final repair = repairHistory[index];
              return PopupMenuItem<int>(
                value: index,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(repair),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove padding
                            minimumSize: Size(24, 24), // Set minimum size
                            shape: CircleBorder(), // Make it circular
                            backgroundColor: Colors.green, // Button color
                          ),
                          child: Icon(
                            Iconsax.tick_circle,
                            size: 16, // Adjust icon size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          },
          icon: Icon(Iconsax.menu),
        ),
      ],
    );
  }
}
