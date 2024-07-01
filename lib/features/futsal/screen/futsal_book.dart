import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/common/utils/date_time_utils.dart';
import 'package:cosmomarket/features/futsal/model/court_model.dart';
import 'package:cosmomarket/features/futsal/widgets/court_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as nepali_picker;
import 'package:nepali_date_picker/nepali_date_picker.dart';
import '../controller/court_controller.dart';

class FutsalBook extends StatefulWidget {
  const FutsalBook({super.key});


  @override
  State<FutsalBook> createState() => _FutsalBookState();
}

class _FutsalBookState extends State<FutsalBook> {
  var _selectedDate = DateTimeUtils.formatDateNoDay(NepaliDateTime.now());
  CourtController courtController=CourtController();
  @override
  Widget build(BuildContext context) {
    String name=ModalRoute.of(context)!.settings.arguments as String;
    List<CourtModel> courts=courtController.courtsAvailable;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name,
              style: AppTheme.appbarTextStyle
            ),
            const Icon(
              Icons.sports_basketball,
              size: 40,
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
                _selectedDate = DateTimeUtils.formatDateNoDay(value);
              });
            },
            selectedDayDecoration:const BoxDecoration(
                color:AppTheme.primaryColor,
                shape: BoxShape.circle
            ),
            todayDecoration:  BoxDecoration(
              border: Border.all(
                color: AppTheme.primaryColor
              ),
              shape: BoxShape.circle
            ),
          ),
          Text(
              "Available Slot on $_selectedDate",
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
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                    return CourtItem(courtModel: courts[index], selectedDate: _selectedDate);
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
}
