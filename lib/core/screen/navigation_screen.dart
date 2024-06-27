import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/core/screen/service_screen.dart';
import 'package:flutter/material.dart';

import 'explore.dart';
import 'home_screen.dart';
import 'more.dart';

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
      body:  IndexedStack(
        index: currentPageIndex,
        children: [
          Home(),
          Services(),
          Explore(),
          More(),
        ],
      ),
    );
  }
}
