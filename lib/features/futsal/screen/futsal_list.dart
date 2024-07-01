import 'package:cosmomarket/common/utils/date_picker_utils.dart';
import 'package:cosmomarket/common/utils/date_time_utils.dart';
import 'package:cosmomarket/common/utils/scrollable_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' show NepaliDateTime;
import '../../../common/styles/theme.dart';
import '../widgets/futsal_item.dart';

class FutsalHeader extends StatefulWidget {
  const FutsalHeader({super.key});

  @override
  State<FutsalHeader> createState() => _FutsalHeaderState();
}

class _FutsalHeaderState extends State<FutsalHeader> {
  String? _selectedLocation;
  String? _selectedSortBy;
  String? _startTime;
  NepaliDateTime _selectedDate = NepaliDateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Center(

          child: Padding(

            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
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
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButton<String>(
                              elevation: 0,
                              underline: const SizedBox.shrink(),
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
                          underline: const SizedBox.shrink(),
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
                  onPressed: () {
                    setState(() {
                      _selectedDate=_selectedDate.subtract(const Duration(days: 1));
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
                    setState(()  {
                      updateDate();
                    });
                  },
                  child: createCustomText(
                    text: DateTimeUtils.formatDate(_selectedDate),
                    fontWeight: FontWeight.w400,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate=_selectedDate.add(const Duration(days: 1));
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
               setState(() {
                 showTimeRangePicker12Hour(context);
               });
              },
              child: Text(_startTime ==null?"Select Start Time":"Start Time:$_startTime"),
            ),
          ),

          const Expanded(child: FutsalItem())
        ],
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

  Future<void> showTimeRangePicker12Hour(BuildContext context) async {
    _startTime=await CustomTimePicker.selectHour(context);
    setState(() {
      _startTime=_startTime;
    });
  }

  Future<void> updateDate() async {
    _selectedDate=
        (await NepaliDatepickerUtils.showDatePickerDialog(context))
            ?? NepaliDateTime.now();
    setState(() {
      _selectedDate=_selectedDate;
    });
  }

}
