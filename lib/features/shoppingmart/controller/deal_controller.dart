import 'package:cosmomarket/features/shoppingmart/services/deal_services.dart';

class DealController{
  fetchDeals(){
    return DealServices().products;
  }
}