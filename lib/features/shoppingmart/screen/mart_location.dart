import 'package:cosmomarket/common/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

import '../../../common/constants/route_name.dart';

class MartLocationSelect extends StatelessWidget {
  const MartLocationSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: AppTheme.appbarTextStyle,
        ),
      ),
      body: const MartLocationSelectPage(),
    );
  }
}

class MartLocationSelectPage extends StatefulWidget {
  const MartLocationSelectPage({super.key});

  @override
  State<MartLocationSelectPage> createState() => _MartLocationSelectPageState();
}

class _MartLocationSelectPageState extends State<MartLocationSelectPage> {
  final List<String> location = ["tinkune", "shantinagar", "Baneshwor"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/imageRes/shopping.png"),
            SearchableDropdown<int>(
              searchHintText: "Search Location",
              hintText: const Text(
                "Select Location",
                style: TextStyle(color: AppTheme.primaryColor),
              ),
              items: location.asMap().entries.map((entry) {
                int index = entry.key;
                String value = entry.value;
                return SearchableDropdownMenuItem<int>(
                  value: index,
                  child: Text(value),
                  label: value,
                );
              }).toList(),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.MartHomePage);
                },
                child: const Text("Save and Next"))
          ]),
    );
  }
}
