import 'package:cosmomarket/features/shoppingmart/services/mart_button_services.dart';

import '../model/mart_button_model.dart';

class MartController{
  final MartServices _martService = MartServices();

  List<MartButtonModel> fetchMarts() {
    return _martService.martList;
  }
}