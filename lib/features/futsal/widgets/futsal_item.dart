import 'package:cosmomarket/common/constants/route_name.dart';
import 'package:cosmomarket/common/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/futsal_model.dart';

class FutsalItem extends StatefulWidget {
  const FutsalItem({super.key});

  @override
  State<FutsalItem> createState() => _FutsalItemState();
}

class _FutsalItemState extends State<FutsalItem> {
  List<Futsal> futsalList = [
    Futsal(
      imgUrl:
          'https://media.istockphoto.com/id/1344473064/photo/payers-in-action-during-soccer-match-in-indoor-field.jpg?s=1024x1024&w=is&k=20&c=Vffah-S0-TL8s4HsdUTaxFxAxQPzRS_tR6P6U5cpT6Y=',
      name: 'Futsal Arena 1',
      location: 'Tinkune',
      rating: 4.5,
      price: 20.0,
    ),
    Futsal(
      imgUrl:
          'https://media.istockphoto.com/id/1344473064/photo/payers-in-action-during-soccer-match-in-indoor-field.jpg?s=1024x1024&w=is&k=20&c=Vffah-S0-TL8s4HsdUTaxFxAxQPzRS_tR6P6U5cpT6Y=',
      name: 'Futsal Arena 2',
      location: 'Shantinagar',
      rating: 4.0,
      price: 18.0,
    ),
    Futsal(
      imgUrl:
          'https://media.istockphoto.com/id/1344473064/photo/payers-in-action-during-soccer-match-in-indoor-field.jpg?s=1024x1024&w=is&k=20&c=Vffah-S0-TL8s4HsdUTaxFxAxQPzRS_tR6P6U5cpT6Y=',
      name: 'Futsal Arena 3',
      location: 'Baneshwor',
      rating: 4.7,
      price: 22.0,
    ),
    Futsal(
      imgUrl:
          'https://media.istockphoto.com/id/1344473064/photo/payers-in-action-during-soccer-match-in-indoor-field.jpg?s=1024x1024&w=is&k=20&c=Vffah-S0-TL8s4HsdUTaxFxAxQPzRS_tR6P6U5cpT6Y=',
      name: 'Futsal Arena 4',
      location: 'Koteshwor',
      rating: 4.2,
      price: 19.0,
    ),
    Futsal(
      imgUrl:
          'https://media.istockphoto.com/id/1344473064/photo/payers-in-action-during-soccer-match-in-indoor-field.jpg?s=1024x1024&w=is&k=20&c=Vffah-S0-TL8s4HsdUTaxFxAxQPzRS_tR6P6U5cpT6Y=',
      name: 'Futsal Arena 5',
      location: 'Boudha',
      rating: 4.8,
      price: 25.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemCount: futsalList.length,
        itemBuilder: (BuildContext context, int index) {
          return createFutsalTile(
              futsalList[index].imgUrl,
              futsalList[index].name,
              futsalList[index].location,
              futsalList[index].rating,
              futsalList[index].price
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width:10.0
          );

        },
      ),
    );
  }

  Widget createFutsalTile(String imgUrl, String name, String location,
      double rating, double price) {
    return GestureDetector(
      onTap: (){
            Navigator.pushNamed(context,RouteName.FUTSALBOOK,arguments: name);
      },
      child: Card(
          shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
          surfaceTintColor: const Color(0xFFFFFFFF),
          elevation: 5.0,
          color: AppTheme.bgColor,
          child: Column(
              children: [
            Image.network(imgUrl),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(      //Detail Parts
                children: [
                  Row(   //name,price
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          name,
                          style: GoogleFonts.inter(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color:AppTheme.primaryColor
                          ),
                      ),
                      Text("Rs.${price.toInt()}/hr",
                          style: GoogleFonts.inter(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color:AppTheme.primaryColor
                          ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(   //location,rating
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppTheme.locationColor,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              color: AppTheme.locationColor
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('$rating',
                              style:GoogleFonts.inter(
                                fontSize: 12.0,
                                color:AppTheme.secondaryTextColor
                              )
                          ),
                          RatingBarIndicator(
                              rating:rating,
                              itemCount: 5,
                              itemSize: 20.0,
                              itemBuilder: (BuildContext context, int index) {
                                return const Icon(
                                    Icons.star,
                                    color:Colors.amber
                                );
                              }
                          ),
                          Text(
                            "(70)",
                            style:GoogleFonts.inter(
                                fontSize: 12.0,
                                color:AppTheme.secondaryTextColor
                            )
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
