import 'package:flutter/Material.dart';

import '../model/offermodel.dart';
class OfferItem extends StatefulWidget {
  final OfferModel offerModel;
  const OfferItem({super.key, required this.offerModel});
  @override
  State<OfferItem> createState() => _OfferItemState();
}

class _OfferItemState extends State<OfferItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
            widget.offerModel.imagePath,
            fit: BoxFit.cover,
        ),
      ),
    );
  }
}
