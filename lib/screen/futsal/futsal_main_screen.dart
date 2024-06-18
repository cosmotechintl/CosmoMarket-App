import 'package:flutter/material.dart';
import 'package:from_to_time_picker/from_to_time_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../theme/Theme.dart';

class FutsalHeader extends StatefulWidget {
  const FutsalHeader({super.key});

  @override
  State<FutsalHeader> createState() => _FutsalHeaderState();
}

class _FutsalHeaderState extends State<FutsalHeader> {
  String? _selectedLocation;
  String? _selectedSortBy;
  String _slotSelected = "Select Slot";
  DateTime _selectedDate = DateTime.now();

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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                          width: 120, // Set the desired width
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButton<String>(
                              elevation: 0,
                              underline: SizedBox.shrink(),
                              value: _selectedLocation,
                              hint: createCustomText(
                                  text: "Tinkune",
                                  fontWeight: FontWeight.w700,
                                  colorCode: 0xFF636869),
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
                          hint: createCustomText(text: "Sort By"),
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
      body: SingleChildScrollView (
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate=_selectedDate.subtract(Duration(days: 1));
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24.0,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePickerDialog(context);
                    },
                    child: createCustomText(
                      text: DateFormat('EEE,yyyy-MMM-dd').format(_selectedDate),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate=_selectedDate.add(Duration(days: 1));
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24.0,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showTimeRangePicker12Hour(context);
                },
                child: Text(_slotSelected),
              ),
            ),
        
          ],
        ),
      ),
    );
  }

  Widget createCustomText({
    required String text,
    int colorCode = 0xFF769CAA,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 17.0,
        fontWeight: fontWeight,
        color: Color(colorCode),
      ),
    );
  }

  void showTimeRangePicker12Hour(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FromToTimePicker(
        onTab: (from, to) {
          if (from.hour < to.hour) {
            Navigator.pop(context);
            setState(() {
              String fromHour = formatHour(from);
              String toHour = formatHour(to);
              _slotSelected = 'Slot Filtered: $fromHour - $toHour';
            });
          }
        },
        dialogBackgroundColor: AppTheme.primaryColor,
        fromHeadlineColor: Colors.white,
        toHeadlineColor: Colors.white,
        upIconColor: Colors.white,
        downIconColor: Colors.white,
        timeBoxColor: AppTheme.primaryColor,
        timeHintColor: Colors.grey,
        timeTextColor: Colors.white,
        dividerColor: AppTheme.primaryColor,
        doneTextColor: Colors.white,
        dismissTextColor: Colors.white,
        defaultDayNightColor: AppTheme.primaryColor,
        defaultDayNightTextColor: Colors.white,
        colonColor: Colors.white,
        showHeaderBullet: true,
      ),
    );
  }

  String formatHour(TimeOfDay time) {
    int hour = time.hour;
    String period = hour >= 12 ? 'pm' : 'am';

    if (hour == 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }

    return '$hour $period';
  }

  void showDatePickerDialog(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
