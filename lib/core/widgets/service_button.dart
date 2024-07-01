import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/service_button_model.dart' show ServiceButtonModel;
import '../../common/styles/theme.dart';

class ServiceButton extends StatelessWidget {
  final ServiceButtonModel model;

  const ServiceButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(model.routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: AppTheme.primaryColor, width: 0.5),
        ),
        color: AppTheme.serviceButtonColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                model.icon,
                size: 44.0,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(height: 10.0),
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
