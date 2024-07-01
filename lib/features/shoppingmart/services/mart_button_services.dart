import '../model/mart_button_model.dart';

class MartServices{
  final List<MartButtonModel> _martList = [
    MartButtonModel(imageLink: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4ulQgWmJ5AIRG58J7IrAYp3aABWJKddRq2g&s', name: 'Bhatbhateni', martId: 1),
    MartButtonModel(imageLink: 'https://play-lh.googleusercontent.com/I28RxH-Rhzt1W1q_r6Ric_4v6spgcXR_Ywj0-FwIBiVjZ5E1Xw1YVYipkQJUVgoYdC0', name: 'Salesberry', martId: 2),
    MartButtonModel(imageLink: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHAJ8GvXvJfWnqHuP1LZA-fvp3VZIOsMnIAg&s', name: 'Bigmart', martId: 3),
  ];

  List<MartButtonModel> get martList => _martList;
}