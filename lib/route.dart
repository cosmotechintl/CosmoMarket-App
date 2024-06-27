import 'package:cosmomarket/core/screen/service_screen.dart';
import 'package:cosmomarket/features/futsal/screen/futsal_book.dart';
import 'package:cosmomarket/features/futsal/screen/futsal_home_screen.dart';
import 'package:flutter/material.dart';

import 'common/constants/route_name.dart';
import 'features/futsal/screen/futsal_booked.dart';
import 'features/futsal/screen/futsal_list.dart';
import 'features/futsal/screen/futsal_payment.dart';

var serviceRoute = Navigator(
  onGenerateRoute: (RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case RouteName.ROOT:
        builder = (BuildContext _) => ServicePage();
        break;
      case RouteName.FUTSAL:
        builder = (BuildContext _) => const FutsalHomeScreen();
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
        builder = (BuildContext _) => FutsalBook();
        break;
      case RouteName.FUTSALLIST:
        builder = (BuildContext _) => FutsalHeader();
        break;
      case RouteName.FUTSALBOOKED:
        builder = (BuildContext _) => FutsalBooked();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  },
);
