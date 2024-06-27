import 'package:cosmomarket/common/styles/theme.dart';
import 'package:cosmomarket/features/futsal/model/court_model.dart';
import 'package:cosmomarket/features/futsal/widgets/futsal_payment_date_section.dart';
import 'package:cosmomarket/features/futsal/widgets/payment_section.dart';
import 'package:cosmomarket/features/futsal/widgets/price_section.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../controller/futsal_controller.dart';

class FutsalPayment extends StatefulWidget {
  const FutsalPayment({super.key});
  @override
  State<FutsalPayment> createState() => _FutsalPaymentState();
}

class _FutsalPaymentState extends State<FutsalPayment> {
   FutsalController futsalController=FutsalController();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final CourtModel court = args['courtModel'] as CourtModel;
    final String selectedDate = args['selectedDate'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          court.name,
          style: AppTheme.appbarTextStyle
        ),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            PriceSection(
                price: court.price,
                discount: court.discount
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FanCarouselImageSlider.sliderType2(
                imagesLink:futsalController.imagesLink,
                expandedImageFitMode: BoxFit.scaleDown,
                isAssets: false,
                autoPlay: false,
                sliderHeight: 300,
                currentItemShadow: const [],
                sliderDuration: const Duration(milliseconds: 200),
                imageRadius: 40,
                slideViewportFraction: 1.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: FutsalPaymentDateSection(
                  courtModel: court,
                  selectedDate: selectedDate
              ),
            ),
            SizedBox(height: 15.0),
            PaymentSection()
          ],
        ),
      )
    );
  }
}
