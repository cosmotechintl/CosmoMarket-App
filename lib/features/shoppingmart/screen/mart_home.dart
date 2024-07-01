import 'package:banner_carousel/banner_carousel.dart';
import 'package:cosmomarket/features/shoppingmart/model/offermodel.dart';
import 'package:cosmomarket/features/shoppingmart/controller/offer_controller.dart';
import 'package:flutter/Material.dart';
import '../widgets/offer_item.dart';

class MartHome extends StatelessWidget {
  const MartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.shopping_cart
              ),
            )
          ],
        ),
      body:MartHomePage()
    );
  }
}

class MartHomePage extends StatefulWidget {
  MartHomePage({super.key});
  final OfferController offerController=OfferController();

  @override
  State<MartHomePage> createState() => _MartHomePageState();
}

class _MartHomePageState extends State<MartHomePage> {
  @override
  Widget build(BuildContext context) {
    List<OfferModel> offerList=widget.offerController.fetchOffers();
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Search Here",
                filled: true,
                prefixIcon: Icon(
                  Icons.search
                ),
                fillColor: Color(0xFFD3E3EB)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0,vertical: 3.0),
            child: BannerCarousel(
                customizedBanners:offerList.map((offerModel)=> OfferItem(offerModel: offerModel)
                ).toList(),
                margin: const EdgeInsets.all(10.0),
                height:200.0,
              spaceBetween: 10.0,
            ),
          ),
        ],
    );
  }
}

