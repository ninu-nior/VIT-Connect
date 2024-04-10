import 'package:flutter/material.dart';
import 'package:vit_connect_plus/features/home/screens/home_screen.dart';
import 'package:vit_connect_plus/features/people_finder/screens/car_pooling.dart';
import 'package:vit_connect_plus/features/people_finder/screens/roommate_finder.dart';
import 'package:vit_connect_plus/features/people_finder/widgets/pf_appbar.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';

class FindCategory {
  final String name;
  final String imageUrl;

  FindCategory({required this.name, required this.imageUrl});
}

class PeopleFinderScreen extends StatelessWidget {
  final List<FindCategory> categories = [
    FindCategory(
      name: 'Car Pooling',
      imageUrl: 'assets/images/taxi.jpg',
    ),
    FindCategory(
      name: 'Roommate finder',
      imageUrl: 'assets/images/people.jpg',
    ),
  ];

  PeopleFinderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PFAppBar(),
          SizedBox(
            height: 32,
          ),
          Container(
            height: MediaQuery.of(context).size.height *
                0.6, // Adjust the height as needed
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      String categoryNameLowerCase =
                          categories[index].name.toLowerCase();
                      if (categoryNameLowerCase == 'car pooling') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarPoolingScreen(),
                          ),
                        );
                      } else if (categoryNameLowerCase == 'roommate finder') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoommateFinderScreen(),
                          ),
                        );
                      } else {
                        // Handle other category taps if needed
                      }
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(categories[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              categories[index].name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
