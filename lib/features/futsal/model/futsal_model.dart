class Futsal {

  final String imgUrl;
  final String name;
  final String location;
  final double rating;
  final double price;

  Futsal({
    required this.imgUrl,
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
  });

  factory Futsal.fromJson(Map<String, dynamic> json) {
    return Futsal(
      imgUrl:json['imgUrl'] ?? '',
      name:json['name'] ?? '',
      location:json['location'] ?? '',
      rating:(json['rating'] ?? 0.0).toDouble(),
      price: (json['price'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'location': location,
      'rating': rating,
      'price': price,
    };
  }
}

class FutsalAvailable extends Futsal{
  FutsalAvailable(
      {
        required super.imgUrl,
        required super.name,
        required super.location,
        required super.rating,
        required super.price
      }
  );

}
