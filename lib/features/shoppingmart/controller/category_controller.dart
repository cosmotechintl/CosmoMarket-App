import 'package:cosmomarket/features/shoppingmart/services/category_services.dart';

class CategoryController{
  CategoryServices categoryServices=CategoryServices();

  fetchCategory(){
    return categoryServices.categories;
  }
}