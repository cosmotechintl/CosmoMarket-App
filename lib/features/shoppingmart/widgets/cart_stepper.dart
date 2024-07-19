import 'package:cart_stepper/cart_stepper.dart';
import 'package:cosmomarket/features/shoppingmart/controller/cart_controller.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/theme.dart';
import '../model/cart_model.dart';
import '../model/productmodel.dart';

class CartStepperWidget extends StatefulWidget {
  final Cart product;
  CartStepperWidget({super.key, required this.product});

  @override
  State<CartStepperWidget> createState() => _CartStepperWidgetState();
}

class _CartStepperWidgetState extends State<CartStepperWidget> {
  int _counter = 0;
  CartController controller=CartController();
  @override
  void initState() {
    _getQuantity();
    super.initState();
  }

  Future<void> _getQuantity() async {
    final cartController=CartController();
    await cartController.getQuantity(widget.product.productId).then(
        (onValue){
          setState(() {
            _counter=onValue;
          });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return CartStepperInt(
      value: _counter,
      size: 35,
      style: CartStepperTheme.of(context).copyWith(
        activeForegroundColor: Colors.white,
        activeBackgroundColor: AppTheme.primaryColor,
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      didChangeCount: (count) {
        setState(() {
          _counter = count;
        });
        _handleCartStepper(count);
      },
    );
  }

  void _handleCartStepper(int count) async {
    Cart cart = Cart(
      productId: widget.product.productId,
      name: widget.product.name,
      quantity: count,
      price: widget.product.price,
      img: widget.product.img,
    );
    if (count > 0) {
      await controller.addToCart(cart);
    } else {
      await controller.removeFromCart(cart.productId);
    }
    await controller.checkIfAddedToCart(widget.product.productId);
    setState((){});
  }


}
