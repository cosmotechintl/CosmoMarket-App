import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/common/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

import '../model/court_model.dart';

class FutsalPaymentDateSection extends StatefulWidget {
  CourtModel courtModel;
  String selectedDate;

  FutsalPaymentDateSection({required this.courtModel,required this.selectedDate,super.key});

  @override
  State<FutsalPaymentDateSection> createState() => _FutsalPaymentDateSectionState();
}

class _FutsalPaymentDateSectionState extends State<FutsalPaymentDateSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
              "assets/logo/calender.png",
              fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  DateTimeUtils.formatDate(NepaliDateTime.parse(DateTimeUtils.convertToNumericFormat(widget.selectedDate))),
                  style: AppTheme.textStyle(colors: Color(0xFF22577A)),
              ),
              Row(
                children: [
                  Text(
                      widget.courtModel.time,
                      style: AppTheme.textStyle(colors: Color(0xFF7297AD),
                  )),
                  VerticalDivider(),
                  Text(
                      "1 hr",
                      style: AppTheme.textStyle(colors:  Color(0xFF7297AD))
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
