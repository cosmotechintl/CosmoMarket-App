import 'package:cosmomarket/features/futsal/model/court_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/constants/route_name.dart';
import '../../../common/styles/theme.dart';

class CourtItem extends StatelessWidget {
  final CourtModel courtModel;
  final String selectedDate;
  const CourtItem({super.key,required this.courtModel ,required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RouteName.FUTSALPAYMENT,arguments:{
          'courtModel': courtModel,
          'selectedDate': selectedDate,
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0),
        child: Card(
          color: AppTheme.accentColor,
          child: Row(
            children: [

              Container(
                height:100,
                width:120,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                ),

                child: Image.asset(
                  "assets/imageRes/court.png",
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.scaleDown,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      courtModel.name,
                      style:GoogleFonts.inter(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color:AppTheme.primaryColor
                      ),
                    ),
                    const SizedBox(
                        height:10.0
                    ),
                    Text(
                      courtModel.time,
                      style: GoogleFonts.inter(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color:AppTheme.primaryColor
                      ),
                    ),
                    const SizedBox(
                        height:10.0
                    ),
                    Text(
                     "Date : $selectedDate",
                      style : GoogleFonts.inter(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color:AppTheme.primaryColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
