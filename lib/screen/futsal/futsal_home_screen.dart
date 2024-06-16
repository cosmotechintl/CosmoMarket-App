import 'package:cosmomarket/screen/futsal/futsal_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../customWidget/DropDown.dart';

class FutsalHomeScreen extends StatefulWidget {
  const FutsalHomeScreen({Key? key}) : super(key: key);

  @override
  _FutsalHomeScreenState createState() => _FutsalHomeScreenState();
}

class _FutsalHomeScreenState extends State<FutsalHomeScreen> {
  List<String> location = ["Tinkune", "Shantinagar", "Baneshwor"];
  List<int> hrs=[1,2,3];
  String? _selectedLocation;
  int optionSelect = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome",
          style: GoogleFonts.hanuman(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF22577A),
              fontSize: 18.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0,3.0,10.0,10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  DropDown(
                    items: location,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    },
                    hintText: 'Select Location',
                  ),
                ],
              ),
            ),
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
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: hrs.map((int choice) {
                    return ChoiceChip(
                        backgroundColor: const Color(0xFFD3E3EB),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 20.0),
                          child: Text("$choice hr"),
                        ),
                        selected: optionSelect == choice,
                        onSelected: (isSelected) {
                          setState(() {
                            if (isSelected)
                              optionSelect = choice;
                          });
                        });
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD5EDF5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: const Color(0xFFCADBE0)
                        )
                      ),
                      elevation: 0.0
                    ),
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>FutsalList()));
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
          ],
        ),
      ),
    );
  }
}
