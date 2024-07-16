class Cart {
  final int? id;
  final int productId;
  final String name;
  final int quantity;
  final String  img;
  final double price;

  Cart({
    this.id,
    required this.img,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'image':img
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'],
      productId: map['product_id'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
      img: map['image'],
    );
  }
}
