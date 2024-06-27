import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class NepaliDatepickerUtils{
  static Future<NepaliDateTime?> showDatePickerDialog(BuildContext context) async {

    return showMaterialDatePicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime.now(),
      lastDate: NepaliDateTime.now().add(const Duration(days:180))
    );

  }

}