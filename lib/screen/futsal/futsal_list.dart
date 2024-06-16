import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FutsalList extends StatefulWidget {
  const FutsalList({super.key});

  @override
  State<FutsalList> createState() => _FutsalListState();
}

class _FutsalListState extends State<FutsalList> {
  String? _selectedLocation;
  String? _selectedSortBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0), // Adjust the padding if necessary
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {  },
                  icon: Icon(
                      Icons.arrow_back,
                    size: 30.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFFFF0000),
                          size: 24.0,
                        ),
                    SizedBox(
                      width: 100, // Set the desired width
                      child: DropdownButton<String>(
                        elevation:0,
                        underline: SizedBox.shrink(),
                        value: _selectedLocation,
                        hint: createCustomText(
                            text: "Tinkune",
                            fontWeight: FontWeight.w700,
                            colorCode:0xFF636869
                        ),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: "Tinkune",
                            child: Text("Tinkune"),
                          ),
                          DropdownMenuItem(
                            value: "Shantinagar",
                            child: Text("Shantinagar"),
                          ),
                          DropdownMenuItem(
                            value: "Baneshwor",
                            child: Text("Baneshwor"),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                      ),
                    ),
                      ],
                    ),
                    const SizedBox(width: 20), // Add some space between dropdowns
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SizedBox(
                        width: 100, // Set the desired width
                        child: DropdownButton<String>(
                          elevation: 0,
                          underline: SizedBox.shrink(),
                          value: _selectedSortBy,
                          hint:  createCustomText(text: "Sort By"),
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              value: "nearest",
                              child: Text("Nearest"),
                            ),
                            DropdownMenuItem(
                              value: "cheapest",
                              child: Text("Cheapest"),
                            ),
                            DropdownMenuItem(
                              value: "nearest_and_cheapest",
                              child: Text("Nearest and Cheapest"),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSortBy = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(
                   onPressed: (){},
                   icon:  const Icon(
                     Icons.arrow_back_ios,
                     size:24.0,
                     color: Color(0xFF00425A),
                   )
               ),
               createCustomText(
                   text: "Wed,20 jestha",
                 fontWeight: FontWeight.w400
               ),
                IconButton(
                    onPressed: (){},
                    icon:  const Icon(
                      Icons.arrow_forward_ios,
                      size:24.0,
                      color: Color(0xFF00425A),
                    )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Start Time",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: const Color(0xFF00425A),
                              fontFamily: GoogleFonts.inter().fontFamily
                            ),
                          ),
                          Icon(
                            Icons.access_time_filled,
                            color: const Color(0xFF00425A),
                          )
                        ],
                      ),
                      style:ElevatedButton.styleFrom(
                        fixedSize: null,
                        backgroundColor: Color(0xFFD3E3EB)
                      )
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 5,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              "End Time",
                              style: TextStyle(
                                fontSize: 15.0,
                                  color: const Color(0xFF00425A),
                                fontFamily: GoogleFonts.inter().fontFamily
                              ),
                          ),
                          Icon(
                              Icons.access_time_filled,
                            color: const Color(0xFF00425A),
                          )
                        ],
                      ),
                      style:ElevatedButton.styleFrom(
                        fixedSize: null,
                        backgroundColor: Color(0xFFD3E3EB)
                      )
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
   Widget createCustomText({required String text,int colorCode=0xFF769CAA,FontWeight fontWeight=FontWeight.w500}){
    return Text(
      text,
      style: GoogleFonts.inter(
          fontSize: 17.0,
          fontWeight: fontWeight,
          color: Color(colorCode)),
    );
   }
}
