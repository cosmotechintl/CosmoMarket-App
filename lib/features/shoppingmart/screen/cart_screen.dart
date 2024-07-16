import 'package:flutter/Material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("My Cart"),
       centerTitle: true,
     ),
     body: const CartScreenPage(),
    );
  }
}

class CartScreenPage extends StatefulWidget {
  const CartScreenPage({super.key});

  @override
  State<CartScreenPage> createState() => _CartScreenPageState();
}

class _CartScreenPageState extends State<CartScreenPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children:[
        DelivaryWidget(),
        CartItems()
      ],
    );
  }
}

class DelivaryWidget extends StatefulWidget {
  const DelivaryWidget({super.key});

  @override
  State<DelivaryWidget> createState() => _DelivaryWidgetState();
}

class _DelivaryWidgetState extends State<DelivaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Adress")
      ],
    );
  }
}

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Row(
        children: [
          Image.network(""),

        ],
      ),
    );
  }
}

