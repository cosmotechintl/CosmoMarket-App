import 'package:cosmomarket/features/shoppingmart/controller/mart_button_controller.dart';
import 'package:cosmomarket/features/shoppingmart/widgets/martbutton.dart';
import 'package:cosmomarket/route.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/route_name.dart';
import '../../../common/styles/theme.dart';

class ShoppingMartList extends StatelessWidget {
  const ShoppingMartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: RouteName.ROOT,
        onGenerateRoute:martRoute
      );
  }
}

class ShoppingMartListPage extends StatefulWidget {
  const ShoppingMartListPage({super.key});

  @override
  State<ShoppingMartListPage> createState() => _ShoppingMartListPageState();
}

class _ShoppingMartListPageState extends State<ShoppingMartListPage> {
  MartController martController=MartController();
  @override
  Widget build(BuildContext context) {
    var martList=martController.fetchMarts();
    return Scaffold(
          appBar: AppBar(
            title: Text(
              "Welcome",
              style: AppTheme.appbarTextStyle,
            ),
          ),
      body: GridView.extent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding:const EdgeInsets.all(10),
        children:martList.map((mart)=>MartButton(martButtonModel: mart)).toList()
      ),
    );
  }
}

