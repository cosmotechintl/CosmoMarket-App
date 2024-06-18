import 'package:cosmomarket/screen/home_screen.dart';
import 'package:cosmomarket/screen/service_screen.dart';
import 'package:cosmomarket/theme/Theme.dart';
import 'package:flutter/material.dart';

class NavigationComponent extends StatefulWidget {
  const NavigationComponent({super.key});

  @override
  State<NavigationComponent> createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: const Color(0xFFECF7FB),
        selectedItemColor:AppTheme.primaryColor, // Set your desired indicator color here
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_outlined),
            activeIcon: Icon(Icons.miscellaneous_services),
            label: 'Services',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            activeIcon: Icon(Icons.more_vert_rounded),
            label: 'More',
          ),

        ],
      ),
      body: createBody(currentPageIndex),
    );
  }

  Widget createBody(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return Home();
      case 1:
        return Services();
      // case 2:
      //   return Explore(); // Assuming there is an Explore widget
      // case 3:
      //   return More(); // Assuming there is a More widget
      default:
        return Home();
    }
  }
}
