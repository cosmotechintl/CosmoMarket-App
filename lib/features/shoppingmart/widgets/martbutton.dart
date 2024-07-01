import 'package:cosmomarket/common/constants/route_name.dart';
import 'package:cosmomarket/features/shoppingmart/model/mart_button_model.dart';
import 'package:flutter/material.dart';
class MartButton extends StatelessWidget {
const   MartButton({super.key, required this.martButtonModel});
  final MartButtonModel martButtonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouteName.MartLocationSelect,arguments: martButtonModel);
      },
      child: Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            martButtonModel.image,
            fit: BoxFit.fill,
          ),
        )
      ),
    );
  }
}
