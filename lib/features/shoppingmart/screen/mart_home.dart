import 'package:banner_carousel/banner_carousel.dart' show BannerCarousel;
import 'package:cosmomarket/common/styles/theme.dart' show AppTheme;
import 'package:cosmomarket/features/shoppingmart/controller/cart_controller.dart';
import 'package:cosmomarket/features/shoppingmart/controller/category_controller.dart' show CategoryController;
import 'package:cosmomarket/features/shoppingmart/controller/deal_controller.dart' show DealController;
import 'package:cosmomarket/features/shoppingmart/model/offermodel.dart' show OfferModel;
import 'package:cosmomarket/features/shoppingmart/controller/offer_controller.dart' show OfferController;
import 'package:cosmomarket/features/shoppingmart/screen/cart_screen.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart' show AppBar, Axis, Badge, BuildContext, Center, CircularProgressIndicator, Color, Column, EdgeInsets, GestureDetector, Icon, IconButton, Icons, InputDecoration, ListView, MainAxisAlignment, Navigator, Padding, Row, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextFormField, ValueKey, Widget;
import '../model/categorymodel.dart' show CategoryModel;
import '../model/productmodel.dart' show Product;
import '../widgets/categoryItem.dart' show CategoryItem;
import '../widgets/deal.dart' show DealItem;
import '../widgets/offer_item.dart' show OfferItem;

class MartHome extends StatefulWidget {
  const MartHome({super.key});

  @override
  State<MartHome> createState() => _MartHomeState();
}

class _MartHomeState extends State<MartHome> {
  int cartCount=0;
  CartController controller= CartController();
  @override
  void initState() {
     _fetchCount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (_)=>const CartScreen()));
              },
              child: Badge(
                  label:Text(cartCount.toString()),
                  child: Icon(Icons.shopping_cart)
              ),
            ),
          ),
        ],
      ),
      body: const MartHomePage(),
    );
  }

  Future<void> _fetchCount() async {
    await controller.getCount().then((onValue){
        setState(() {
          cartCount=onValue;
        });
    });;
  }
}

class MartHomePage extends StatefulWidget {
  const MartHomePage({super.key});

  @override
  State<MartHomePage> createState() => _MartHomePageState();
}

class _MartHomePageState extends State<MartHomePage> {
  late List<OfferModel> offerList;
  late List<CategoryModel> categoryList;
  late List<Product> productList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData(){
    final CategoryController categoryController = CategoryController();
    final OfferController offerController = OfferController();
    final DealController dealController=DealController();
    offerList = offerController.fetchOffers();
    categoryList = categoryController.fetchCategory();
    productList=dealController.fetchDeals();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Search Here",
                filled: true,
                prefixIcon: Icon(Icons.search),
                fillColor: Color(0xFFD3E3EB),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
            child: BannerCarousel(
              customizedBanners: offerList
                  .map((offerModel) => OfferItem(offerModel: offerModel))
                  .toList(),
              margin: const EdgeInsets.all(10.0),
              height: 200.0,
              spaceBetween: 10.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    // Add your onTap logic here
                  },
                  child: Text(
                    "See All",
                    style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(
                  key: ValueKey(categoryList[index].categoryId),
                  categoryModel: categoryList[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Todays Deal",
                  style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    "See All",
                    style: AppTheme.textStyle(colors: AppTheme.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height:300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return DealItem(
                  key: ValueKey(productList[index].id),
                  product: productList[index]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
