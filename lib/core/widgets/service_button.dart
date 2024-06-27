import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/service_button_model.dart';
import '../../common/styles/theme.dart';

class ServiceButton extends StatelessWidget {
  final ServiceButtonModel model;

  ServiceButton({required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: AppTheme.primaryColor, width: 1.0),
      ),
      color: AppTheme.serviceButtonColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(model.routeName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                model.icon,
                size: 44.0,
                color: AppTheme.primaryColor,
              ),
              SizedBox(height: 10),
              Text(
                model.services,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSerif4(
                  color: AppTheme.primaryColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
