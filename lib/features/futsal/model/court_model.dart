class CourtModel {
  final String _name;
  final String _id;
  final String _time;
  final double _price;
  final double _discount;

  CourtModel({
    required String name,
    required String id,
    required String time,
    required double price,
    required double discount,
  })  : _name = name,
        _id = id,
        _time = time,
        _price = price,
        _discount = discount;

  // Getters
  String get name => _name;
  String get id => _id;
  String get time => _time;
  double get price => _price;
  double get discount => _discount;

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    return CourtModel(
      name: json['name'],
      id: json['id'],
      time: json['time'],
      price: (json['price'] ?? 0.0).toDouble(),
      discount: (json['discount'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'id': _id,
      'time': _time,
      'price': _price,
      'discount': _discount,
    };
  }
}
