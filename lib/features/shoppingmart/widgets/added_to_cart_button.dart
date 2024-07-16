import 'package:cosmomarket/features/shoppingmart/controller/cart_controller.dart';
import 'package:cosmomarket/features/shoppingmart/model/cart_model.dart';
import 'package:flutter/material.dart';

import '../model/productmodel.dart';

class AddedToCartButton extends StatefulWidget {
  final Product product;
  final double height;
  final double width;
  final double textSize;
  const AddedToCartButton({
    super.key,
    required this.product,
    this.height = 15.0,
    this.width = 145.0,
    this.textSize = 14.0,
  });

  @override
  State<AddedToCartButton> createState() => _AddedToCartButtonState();
}

class _AddedToCartButtonState extends State<AddedToCartButton> {
  late bool addedToCart=false;
  late CartController cartController;

  @override
  void initState() {
    super.initState();
    cartController = CartController();
    _checkIfAddedToCart();
  }

  Future<void> _checkIfAddedToCart() async {
    await cartController.checkIfAddedToCart(widget.product.id);
    setState(() {
      addedToCart = cartController.addedToCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!addedToCart) {
          await addToCart();
        } else {
          await removeFromCart();
        }
        setState(() {
          addedToCart = !addedToCart;
        });
      },
      child: addedToCart
          ? Icon(Icons.check_circle, size: widget.textSize)
          : Text("Add Item", style: TextStyle(fontSize: widget.textSize)),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: widget.textSize),
        fixedSize: Size(widget.width, widget.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Future<void> addToCart() async {
    Cart cart = Cart(
      productId: widget.product.id,
      name: widget.product.name,
      quantity: 1,
      price: widget.product.price,
      img: widget.product.img,
    );
    await cartController.addToCart(cart);
  }

  Future<void> removeFromCart() async {
    await cartController.removeFromCart(widget.product.id);
  }
}
