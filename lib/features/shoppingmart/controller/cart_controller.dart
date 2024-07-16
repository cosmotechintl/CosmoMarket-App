import '../services/mart_database_services.dart';
import '../model/cart_model.dart';

class CartController {
  late MartDatabaseHelper _martDatabaseHelper;
  bool _addedToCart = false;
  bool get addedToCart => _addedToCart;

  CartController() {
    _martDatabaseHelper = MartDatabaseHelper();
  }

  Future<void> checkIfAddedToCart(int productId) async {
    bool isInCart = await _martDatabaseHelper.isProductInCart(productId);
    _addedToCart = isInCart;
  }

  Future<void> addToCart(Cart cart) async {
    await _martDatabaseHelper.insertOrUpdateCart(cart);
    _addedToCart = true;
  }

  Future<void> removeFromCart(int productId) async {
    await _martDatabaseHelper.deleteByProductId(productId);
    _addedToCart = false;
  }

  Future<int> getQuantity(int productId) async {
    int quantity = await _martDatabaseHelper.getQuantity(productId);
    return quantity;
  }
}
