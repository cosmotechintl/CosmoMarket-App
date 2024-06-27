import '../model/court_model.dart';

class CourtController{
  final List<CourtModel> _courts = [
    CourtModel(
      name: 'Court 1',
      id: '001',
      time: '8:00 am - 9:00 am',
      price: 50.0,
      discount: 15.0,
    ),
    CourtModel(
      name: 'Court 2',
      id: '002',
      time: '9:00 am - 10:00 am',
      price: 60.0,
      discount: 20.0,
    ),
    CourtModel(
      name: 'Court 3',
      id: '003',
      time: '10:00 am - 11:00 am',
      price: 55.0,
      discount: 12.0,
    ),
  ];

  List<CourtModel> get courtsAvailable => _courts;
}