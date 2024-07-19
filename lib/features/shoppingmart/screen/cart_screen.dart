import 'package:cosmomarket/features/shoppingmart/controller/cart_controller.dart';
import 'package:cosmomarket/features/shoppingmart/model/productmodel.dart';
import 'package:cosmomarket/features/shoppingmart/widgets/cart_stepper.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/styles/theme.dart';
import '../model/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text("My Cart"),
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
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: fetchCart(),
      builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const CircularProgressIndicator();
        }
        else if(snapshot.hasError){
          return const Center(child:Text("Error"));
        }
        else if(snapshot.hasData){
          dynamic carts=snapshot.data;
          return Column(
            children:[
              const DelivaryWidget(),
              Expanded(
                  child: ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItems(cart:carts[index]);
                    },

                  )
              ),
            ],
          );
        }
        else {
          return const Text("error");
        }
      },
    );
  }

  Future<List<Cart>>? fetchCart() async {
    CartController controller=CartController();
    return controller.getCarts();
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
    return const Row(
      children:[
        Text("Address"),
      ],
    );
  }
}

class CartItems extends StatefulWidget {
  final Cart cart;
  const CartItems({super.key, required this.cart});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border:Border.all(color:const Color(0x66666600))
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child:  Image.network(widget.cart.img),
            ),
          Column(
              children: [
                Column(
                 children: [
                   Text(
                       widget.cart.name,
                        style: GoogleFonts.ubuntu(
                       color: AppTheme.primaryColor,
                       fontSize: 18.0,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                   Text(
                       widget.cart.quantity.toString()
                   ),
                 ],
                ),
                Text(
                  widget.cart.price.toString(),
                  style: GoogleFonts.ubuntu(
                    color: AppTheme.primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CartStepperWidget(
                    product:widget.cart,

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

