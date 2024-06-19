import 'package:cosmomarket/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as nepali_picker;

class FutsalBook extends StatefulWidget {
  final String name;

  FutsalBook({required this.name});

  @override
  State<FutsalBook> createState() => _FutsalBookState();
}

class _FutsalBookState extends State<FutsalBook> {
  var _selectedDate = nepali_picker.NepaliDateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = nepali_picker.NepaliDateFormat("yyyy-MMMM-dd").format(_selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.name),
            const Icon(
              Icons.sports_basketball,
              color: AppTheme.primaryColor,
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          nepali_picker.CalendarDatePicker(
            initialDate: nepali_picker.NepaliDateTime.now(),
            firstDate: nepali_picker.NepaliDateTime.now(),
            lastDate: nepali_picker.NepaliDateTime.now().add(
              const Duration(days: 100),
            ),
            onDateChanged: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
          ),
          Text(
              "Available Slot on $formattedDate",
              style: GoogleFonts.inter(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color:AppTheme.primaryColor
              ),
          ),
          const SizedBox(
            height:10.0
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return createCourt(index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createCourt(int index) {
    return Card(
      color: AppTheme.accentColor,
      child: Row(
        children: [
          Container(
            height: 100.0,
            width:100.0,
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
            ),
            child: Image.asset(
              "assets/imageRes/court.png",
              width: 100.0,
              height: 100.0,
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            "Court $index",
            style:GoogleFonts.inter(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color:AppTheme.primaryColor
            ),
          ),
          Text(
            "Time: 8:00 am - 9:00 am",
            style: GoogleFonts.inter(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color:AppTheme.primaryColor
            ),
          ),
          Text(
            "Date: 14th June",
            style:GoogleFonts.inter(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color:AppTheme.primaryColor
            ),
          ),
        ],
      ),
    );
  }
}
