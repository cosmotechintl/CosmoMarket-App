import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/features/shoppingmart/model/offermodel.dart';
import 'package:cosmomarket/features/shoppingmart/services/mart_database_services.dart';
import 'package:cosmomarket/features/shoppingmart/widgets/pricewithline.dart';
import 'package:cosmomarket/features/shoppingmart/widgets/similar_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/deal_controller.dart';
import '../controller/offer_controller.dart';
import '../controller/cart_controller.dart';
import '../model/cart_model.dart';
import '../model/productmodel.dart';
import '../widgets/cart_stepper.dart';
import '../widgets/deal.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProductDetailPage()),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late List<Product> productList;
  late List<OfferModel> offerList;
  late Product product;
  late CartController cartController;

  @override
  void initState() {
    final OfferController offerController = OfferController();
    final DealController dealController = DealController();
    offerList = offerController.fetchOffers();
    productList = dealController.fetchDeals();
    cartController = CartController();
    super.initState();
  }

  Future<void> _checkIfAddedToCart() async {
    await cartController.checkIfAddedToCart(product.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as Product;
    _checkIfAddedToCart();
    return SingleChildScrollView(
      child: Stack(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.arrow_back, size: 30),
              Row(
                children: [
                  Icon(Icons.search, size: 30),
                  Icon(Icons.shopping_cart, size: 30),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      product.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name.trim(),
                          style: GoogleFonts.inter(
                              color: AppTheme.primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "1 kg",
                          style: GoogleFonts.inter(
                              color: AppTheme.primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              " Rs.${product.price - product.discount}",
                              style: GoogleFonts.inter(
                                  color: AppTheme.primaryColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 5.0),
                            PriceWithLine(
                              text: product.price.toString(),
                              lineColor: AppTheme.textStrokeColor,
                              textColor: AppTheme.textStrokeColor,
                              fontSize: 14.0,
                              lineHeight: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CartStepperWidget(value: (count) => _handleCartStepper(count), productId: product.id,)
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              DescriptionText(description: product.description),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Similar Product",
                      style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "See All",
                        style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 270.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SimilarProduct(
                        key: ValueKey(productList[index].id),
                        product: productList[index]);
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Deal",
                      style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "See All",
                        style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DealItem(
                        key: ValueKey(productList[index].id),
                        product: productList[index]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleCartStepper(int count) async {
    Cart cart = Cart(
      productId: product.id,
      name: product.name,
      quantity: count,
      price: product.price,
      img: product.img,
    );
    if (count > 0) {
      await cartController.addToCart(cart);
    } else {
      await cartController.removeFromCart(cart.productId);
    }
    await cartController.checkIfAddedToCart(product.id);
    setState((){});
  }
}

class DescriptionText extends StatefulWidget {
  final String description;
  const DescriptionText({super.key, required this.description});

  @override
  State<DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            show = !show;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Product Details",
                  style: GoogleFonts.inter(
                      color: AppTheme.primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800),
                ),
                Icon(
                  show ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
                  color: AppTheme.primaryColor,
                  size: 50,
                ),
              ],
            ),
            if (show)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  widget.description,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
