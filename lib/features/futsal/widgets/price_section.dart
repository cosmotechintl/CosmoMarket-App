import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/common/utils/math_utils.dart';
import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  final double price;
  final double discount;

  const PriceSection(
      {super.key, required this.price, required this.discount}
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          color: AppTheme.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: AppTheme.textStyle(colors: Color(0xFFE7EFF2)),
                    ),
                    Text(
                      price.toString(),
                      style: AppTheme.textStyle(colors: Color(0xFFE7EFF2))
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount",
                      style: AppTheme.textStyle(colors:Color(0xFF9FC1CE)),
                    ),
                    Text(
                      discount.toString(),
                      style: AppTheme.textStyle(colors:Color(0xFF9FC1CE)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "Total Price",
                      style: AppTheme.textStyle(colors: Colors.white),
                    ),

                    Text(
                      MathUtils.calculateTotalPrice(price, discount).toString(),
                      style: AppTheme.textStyle(colors: Colors.white),
                    ),

                  ],
                ),

              ],
            ),
          ),

      ),
    );
  }
}
