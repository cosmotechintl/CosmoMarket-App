import 'package:cosmomarket/features/shoppingmart/services/offer_services.dart';

import '../model/offermodel.dart';

class OfferController{
  OfferServices offerServices= OfferServices();

  List<OfferModel> fetchOffers(){
      return offerServices.getOfferList();
  }
}