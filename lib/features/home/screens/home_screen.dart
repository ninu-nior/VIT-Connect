import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/common/widgets/appbar.dart';
import 'package:vit_connect_plus/common/widgets/circular_container.dart';
import 'package:vit_connect_plus/features/home/screens/laundry_screen.dart';
import 'package:vit_connect_plus/features/home/screens/repair_screen.dart';
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
              color: MyColors.white,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Good Morning,",
                      style: TextStyle(
                          color: MyColors.darkerGrey,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Juhi Mantri",
                      style: TextStyle(
                          color: MyColors.darkerGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [Container()],
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RepairScreen()),
                );
              },
              child: Container(
                height: 170,
                color: MyColors.primary,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset("assets/images/repair.png"),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Need Room ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .apply(color: MyColors.lightContainer),
                          ),
                          Text(
                            "Repairs ?",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "___________",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LaundryScreen()),
                );
              },
              child: Container(
                height: 170,
                color: MyColors.primary.withOpacity(0.6),
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check laundry ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .apply(color: MyColors.lightContainer),
                          ),
                          Text(
                            "Schedule ?",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .apply(fontSizeFactor: 1),
                          ),
                          Text(
                            "___________",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/washing.png"),
                  ],
                ),
              ),
            ),
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
            "",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: const Color.fromRGBO(158, 158, 158, 1)),
          ),
          SizedBox(height: 4),
          Text(
            "",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.black),
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
