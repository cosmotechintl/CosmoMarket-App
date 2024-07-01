import 'package:cosmomarket/common/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class NepaliDatepickerUtils{
  static Future<NepaliDateTime?> showDatePickerDialog(BuildContext context) async {
    return showMaterialDatePicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime.now(),
      lastDate: NepaliDateTime.now().add(const Duration(days: 180)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primaryColor,
              onPrimary: Colors.white,
              surface: AppTheme.serviceButtonColor,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:AppTheme.primaryColor, // button text color
              ),
            ),
            dialogBackgroundColor:AppTheme.serviceButtonColor,
          ),
          child: child!,
        );
      },
    );
  }
}