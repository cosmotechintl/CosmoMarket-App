import 'package:flutter/material.dart';

class ServiceButtonModel {
  final String _services;
  final IconData _icon;
  final String _routeName;
  ServiceButtonModel({
    required String services,
    required IconData icon,
    required String routeName,
  })  :_services = services,
        _icon = icon,
        _routeName = routeName;

  String get routeName => _routeName;
  IconData get icon => _icon;
  String get services => _services;
}
