import 'package:cosmomarket/screen/futsal/futsal_home_screen.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Services',
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.extent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          children: [
            createServicesCardButton("Futsal\nRental", Icons.sports_baseball_outlined),
            createServicesCardButton("Restaurant\nServices", Icons.restaurant_menu),
            createServicesCardButton("Shopping\nMart", Icons.shopping_cart_outlined),
            createServicesCardButton("Hotel\nBooking", Icons.local_hotel_outlined),
            createServicesCardButton("vehicles\nRental", Icons.sports_baseball_outlined),
            createServicesCardButton("vehicles\nRental", Icons.sports_baseball_outlined),
            createServicesCardButton("vehicles\nRental", Icons.sports_baseball_outlined),
            createServicesCardButton("vehicles\nRental", Icons.sports_baseball_outlined),
          ],
        ),
      ),
    );
  }

  Widget createServicesCardButton(String name, IconData iconName) {
    return Card(
      color: Color(0xFFECF7FB),
      child: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(
              builder: (_)=>const FutsalHomeScreen()
          )
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconName,
              size: 44.0,
            ),
            SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}