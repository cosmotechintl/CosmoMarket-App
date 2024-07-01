import '../model/offermodel.dart';

class OfferServices{

  List<OfferModel> offerList = [
    OfferModel(id: '1', imagePath: 'https://blog.esewa.com.np/wp-content/uploads/2020/08/bigmart-blog.jpg', martId: 1),
    OfferModel(id: '2', imagePath: 'https://blog.esewa.com.np/wp-content/uploads/2020/08/bigmart-blog.jpg', martId: 1),
    OfferModel(id: '3', imagePath: 'https://blog.esewa.com.np/wp-content/uploads/2020/08/bigmart-blog.jpg', martId: 1),
  ];

  List<OfferModel> getOfferList(){
    return offerList;
  }
}