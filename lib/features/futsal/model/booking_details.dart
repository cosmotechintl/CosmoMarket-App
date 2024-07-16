import 'court_model.dart' show CourtModel;
class BookingDetails {
  final CourtModel _courtModel;
  final String _selectedDate;

  BookingDetails(courtModel,selectedDate):
      _courtModel=courtModel,
      _selectedDate=selectedDate;

  CourtModel get courtModel => _courtModel;
  String get selectedDate => _selectedDate;
}
