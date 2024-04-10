import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_connect_plus/features/healthcare/screens/health_care_screen.dart';
import 'package:vit_connect_plus/features/home/screens/home_screen.dart';
import 'package:vit_connect_plus/features/lost_and_found/screens/lost_and_found_screen.dart';
import 'package:vit_connect_plus/features/people_finder/screens/people_finder.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    //new instance of navigation controller is created
    //now we can easily use whats inside the controller using the controller property
    final controller = Get.put(NavigationController());
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        //instead of passing navigation bar as child, we pass it as a function
        () => NavigationBar(
          height: 80,
          elevation: 0,
          //selectedIndex is a Rx type, so to get integer value we use .value
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: dark ? MyColors.black : MyColors.white,
          indicatorColor: dark
              ? MyColors.white.withOpacity(0.1)
              : MyColors.black.withOpacity(0.1),

          //now the value of selected index is updated, but now how do we redraw the screen?to do that,
          //we wrap the the navigation bar with another widget, the obs widget
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: "home"),
            NavigationDestination(
                icon: Icon(Iconsax.health), label: "Healthcare"),
            NavigationDestination(
                icon: Icon(Iconsax.search_normal), label: "People Finder"),
            NavigationDestination(
                icon: Icon(Iconsax.box_search), label: "Lost and Found")
          ],
        ),
      ),
      //we need to apply obx here too otherwise it wont change unless we refresh everytime
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  //setsate redraws everything when it is called
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const HealthCareScreen(),
     PeopleFinderScreen(),
    const LostAndFoundScreen()
  ];
}
