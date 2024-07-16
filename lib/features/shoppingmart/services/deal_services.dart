import '../model/productmodel.dart';

class DealServices {
  List<Product> products = [
    Product(
      name: " Dabur Honey",
      img: "https://i.postimg.cc/JzznydRg/finpharm-OTC-7506-3-1.png",
      description: "Dabur Honey is 100% pure and natural. It is rich in antioxidants and has various health benefits. Use it as a natural sweetener in your tea, toast, and other recipes. It helps in weight management, improves digestion, and boosts immunity.",
      price: 100.0,
      discount: 10.0,
      id: 1,
    ),
    Product(
      name: "Fortune Aata",
      img: "https://imgs.search.brave.com/OFxVvVadfpL9Hhtiq0GvCinKyGq_vohLfJ1WQhdJDrc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NjE4R0gxenZTUkwu/anBn",
      description: "Description of Product 2",
      price: 150.0,
      discount: 15.0,
      id: 2,
    ),
    Product(
      name: "Newari Rice",
      img: "https://static-01.daraz.com.np/p/f30b4403dd32c35a086a0fa336f98f4c.png_750x750.jpg_.webp",
      description: "Description of Product 3",
      price: 200.0,
      discount: 20.0,
      id: 3,
    )
  ];
}
