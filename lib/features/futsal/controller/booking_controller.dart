import '../model/booking_details.dart';
import '../model/court_model.dart';

class BookingController {

  BookingDetails bookCourt(CourtModel selectedCourt, String selectedDate) {
    return BookingDetails(selectedCourt, selectedDate);
  }
}
