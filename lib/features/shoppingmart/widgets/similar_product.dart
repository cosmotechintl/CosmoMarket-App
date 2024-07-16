import 'package:cosmomarket/common/constants/route_name.dart';
import 'package:cosmomarket/features/shoppingmart/model/cart_model.dart';
import 'package:cosmomarket/features/shoppingmart/services/mart_database_services.dart';
import 'package:cosmomarket/features/shoppingmart/widgets/pricewithline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/styles/theme.dart';
import '../model/productmodel.dart';
import 'added_to_cart_button.dart';

class SimilarProduct extends StatelessWidget {
  final Product product;
  const SimilarProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteName.MartProductDetails, arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: 150,
        child: Card(
          elevation: 4.0,
          color: const Color(0xFFF7F7FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                product.img,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 5.0),
              Center(
                child: Text(
                  product.name,
                  style: GoogleFonts.ubuntu(
                    color: AppTheme.primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${product.price - product.discount}",
                      style: GoogleFonts.ubuntu(
                        color: AppTheme.primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    PriceWithLine(
                      text: product.price.toString(),
                      lineColor: AppTheme.textStrokeColor,
                      textColor: AppTheme.textStrokeColor,
                      fontSize: 16.0,
                      lineHeight: 1,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AddedToCartButton(product: product,height:5,width: 120),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

