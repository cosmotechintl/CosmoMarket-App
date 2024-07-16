import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/core/screen/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          debugPrint("hello $didPop");
          if (didPop) {
            return;
          }
          showAlertDialog(context);
        },
      child: Scaffold(
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
          children: const [
            Home(),
            Services(),
            Explore(),
            More(),
          ],
        ),
      ),
    );
  }

  Future showAlertDialog(BuildContext context) async {
    showDialog(
        context:context ,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top:50.0,bottom: 50.0),
            child: AlertDialog(
              backgroundColor: AppTheme.bgColor,
              content: const Text("Do You Want To Exit"),
              contentTextStyle: AppTheme.textStyle(colors: AppTheme.primaryColor),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    SystemNavigator.pop();
                  },
                  child: const Text("yes"),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No"),
                )
              ],
            ),
          );
        }

    );
    return true;
  }
}
