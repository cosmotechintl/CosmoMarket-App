import '../../common/constants/route_name.dart';
import '../model/service_button_model.dart';
import 'package:flutter/material.dart';

class ServiceController {

  final List<ServiceButtonModel> _serviceButtons = [

    ServiceButtonModel(
      services: "Futsal\nRental",
      icon: Icons.sports_baseball_outlined,
      routeName: RouteName.FUTSAL,
    ),

    ServiceButtonModel(
      services: "Restaurant\nServices",
      icon: Icons.restaurant_menu,
      routeName: RouteName.FUTSAL,
    ),

    ServiceButtonModel(
      services: "Shopping\nMart",
      icon: Icons.shopping_cart_outlined,
      routeName: RouteName.MART,
    ),

    ServiceButtonModel(
      services: "Hotel\nBooking",
      icon: Icons.local_hotel_outlined,
      routeName: RouteName.FUTSAL,
    ),

    ServiceButtonModel(
      services: "Vehicles\nRental",
      icon: Icons.car_rental,
      routeName: RouteName.FUTSAL,
    ),

    ServiceButtonModel(
      services: "Banquet\nRental",
      icon: Icons.villa,
      routeName: RouteName.FUTSAL
    ),

  ];

  List<ServiceButtonModel> get serviceButtons => _serviceButtons;

}
