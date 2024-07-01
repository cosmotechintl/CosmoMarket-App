import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/core/controller/servicecontroller.dart';
import 'package:cosmomarket/core/model/service_button_model.dart';
import 'package:cosmomarket/route.dart';
import 'package:flutter/material.dart';
import '../widgets/service_button.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return serviceRoute;
  }
}

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  late ServiceController _serviceController;
  late List<ServiceButtonModel> _servicesButton;
  @override
  void initState() {
    _serviceController=ServiceController();
    _servicesButton=_serviceController.serviceButtons;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Services',
              style:AppTheme.appbarTextStyle,
          ),
      ),

      body: GridView.extent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: _servicesButton.map(
                (model) => ServiceButton(model: model)
        ).toList(),
        ),
    );

  }
}