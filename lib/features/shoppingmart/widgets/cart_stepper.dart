import 'package:cart_stepper/cart_stepper.dart';
import 'package:cosmomarket/features/shoppingmart/controller/cart_controller.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/theme.dart';

class CartStepperWidget extends StatefulWidget {
  final Function(int count) value;
  final int productId;
  const CartStepperWidget({super.key, required this.value, required this.productId});

  @override
  State<CartStepperWidget> createState() => _CartStepperWidgetState();
}

class _CartStepperWidgetState extends State<CartStepperWidget> {
  int _counter = 0;


  @override
  void initState() {
    _getQuantity();
    super.initState();
  }

  Future<void> _getQuantity() async {
    final cartController=CartController();
    _counter=await cartController.getQuantity(widget.productId);
    setState(() {

    });
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
        widget.value(count);
      },
    );
  }


}
