import 'package:nepali_date_picker/nepali_date_picker.dart';

class DateTimeUtils{
  static String convertTo12hrFormat(int hour) {

    String period = hour >= 12 ? 'pm' : 'am';

    if (hour == 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }

    return '$hour $period';

  }



  static String formatDate(NepaliDateTime nepaliDateTime){
    return NepaliDateFormat('EEE,yyyy-MMM-dd').format(nepaliDateTime);
  }
  static String formatDateNoDay(NepaliDateTime nepaliDateTime){
    return NepaliDateFormat('yyyy-MMM-dd').format(nepaliDateTime);
  }

  static String convertToNumericFormat(String nepaliDate) {
    Map<String, int> monthMap = {
      'Bai': 1,
      'Jes': 2,
      'Asar': 3,
      'Shr': 4,
      'Bha': 5,
      'Ash': 6,
      'Kar': 7,
      'Marg': 8,
      'Pou': 9,
      'Mag': 10,
      'Fal': 11,
      'Cha': 12,
    };

    List<String> parts = nepaliDate.split('-');
    if (parts.length != 3) {
      throw FormatException('Invalid Nepali date format: $nepaliDate');
    }

    int month = monthMap[parts[1]] ?? 00;

    // Format into yyyy-MM-dd
    String formattedDate = '${parts[0]}-${month.toString().padLeft(
        2, '0')}-${parts[2]}';
    return formattedDate;
  }
}