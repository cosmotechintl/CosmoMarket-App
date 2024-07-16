import 'package:cosmomarket/common/constants/route_name.dart';
import 'package:cosmomarket/common/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

import '../../../route.dart';


class FutsalHomeScreen extends StatelessWidget {
  const FutsalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return futsalRoute;
  }
}


class FutsalHomeScreenBody extends StatefulWidget {
  const FutsalHomeScreenBody({super.key});

  @override
  _FutsalHomeScreenBodyState createState() => _FutsalHomeScreenBodyState();
}

class _FutsalHomeScreenBodyState extends State<FutsalHomeScreenBody> {
  List<String> location = [ "Use Your Precise Location","Tinkune", "Shantinagar", "Baneshwor"];
  List<int> hrs=[1,2,3];
  String? _selectedLocation;
  int optionSelect = 1;

  double _selectedValue=1.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome",
          style: GoogleFonts.hanuman(
              fontWeight: FontWeight.w700,
              color:AppTheme.appbarTextColor,
              fontSize: 18.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0,3.0,10.0,10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/imageRes/futsal.png",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Location",
                      style: GoogleFonts.inter(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF22577A)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SearchableDropdown<int>(
                      searchHintText:"Search Location",
                      hintText: const Text(
                        "Select Location",
                        style: TextStyle(
                            color:AppTheme.primaryColor
                        ),
                      ),
                      items: location.asMap().entries.map((entry) {
                        int index = entry.key;
                        String value = entry.value;
                        return SearchableDropdownMenuItem<int>(
                          value: index,
                          child: value=="Use Your Precise Location"?Row(
                            children: [
                              const Icon(
                                Icons.location_searching_sharp,
                                size:18.0
                              ),
                             const SizedBox(
                               width: 20.0,
                             ),
                              Text(value),
                            ],
                          ):Text(value),
                          label: value,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Session Duration",
                    style: GoogleFonts.inter(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF22577A)),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Slider.adaptive(
                            value: _selectedValue,
                            label: "${_selectedValue.toInt()} hr",
                            min: 1.0,
                            max:24.0,
                            divisions: 24,
                            onChanged: (value){
                              setState(() {
                                _selectedValue=value;
                              });
                            }
                        ),
                      ),
                      Text("${_selectedValue.toInt()} hr",
                        style: const TextStyle(
                            color:AppTheme.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD5EDF5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(
                            color: Color(0xFFCADBE0)
                        )
                    ),
                    elevation: 0.0
                ),
                onPressed:(){
                  Navigator.pushNamed(context,RouteName.FUTSALLIST) ;
                },
                child: Text(
                  "Save and Next",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6993AB)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}