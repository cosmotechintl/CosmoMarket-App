class Product {
  final int _id;
  final String _name;
  final String _img;
  final String _description;
  final double _price;
  final double _discount;
  Product({
    required int id,
    required String name,
    required String img,
    required String description,
    required double price,
    required double discount,
  })   :_id=id,
        _name = name,
        _img = img,
        _description = description,
        _price = price,
        _discount = discount;


  int get id => _id;

  double get discount => _discount;

  double get price => _price;

  String get description => _description;

  String get img => _img;

  String get name => _name;
}
