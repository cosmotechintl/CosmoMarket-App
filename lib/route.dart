import 'package:cosmomarket/core/screen/service_screen.dart';
import 'package:cosmomarket/features/futsal/screen/futsal_book.dart';
import 'package:cosmomarket/features/futsal/screen/futsal_home_screen.dart';
import 'package:cosmomarket/features/shoppingmart/screen/mart_location.dart';
import 'package:cosmomarket/features/shoppingmart/screen/mart_display.dart';
import 'package:flutter/material.dart';

import 'common/constants/route_name.dart';
import 'features/futsal/screen/futsal_booked.dart';
import 'features/futsal/screen/futsal_list.dart';
import 'features/futsal/screen/futsal_payment.dart';
import 'features/shoppingmart/screen/mart_home.dart';

var serviceRoute = Navigator(
  onGenerateRoute: (RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case RouteName.ROOT:
        builder = (BuildContext _) => const ServicePage();
        break;
      case RouteName.FUTSAL:
        builder = (BuildContext _) => const FutsalHomeScreen();
        break;
      case RouteName.MART:
        builder = (BuildContext _) => const ShoppingMartList();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  },
);

var futsalRoute = Navigator(
    onGenerateRoute: (RouteSettings settings) {
    WidgetBuilder builder;
  switch (settings.name) {
    case RouteName.ROOT:
      builder = (BuildContext _) => const FutsalHomeScreenBody();
      break;
    case RouteName.FUTSALPAYMENT:
      builder = (BuildContext _) => const FutsalPayment();
      break;
    case RouteName.FUTSALBOOK:
      builder = (BuildContext _) => const FutsalBook();
      break;
    case RouteName.FUTSALLIST:
      builder = (BuildContext _) => const FutsalHeader();
      break;
    case RouteName.FUTSALBOOKED:
      builder = (BuildContext _) => const FutsalBooked();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
});

var martRoute = (RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case RouteName.ROOT:
      builder = (BuildContext _) => const ShoppingMartListPage();
      break;
    case RouteName.MartLocationSelect:
      builder = (BuildContext _) => const MartLocationSelect();
      break;
      case RouteName.MartHomePage:
      builder = (BuildContext _) => const MartHome();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
};
