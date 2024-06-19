import 'package:flutter/material.dart';

class AppTheme {
  static const Color bgColor=Color(0xFFE1F1F7);
  static const Color primaryColor =Color(0xFF00425A);
  static const Color serviceButtonColor = Color(0xFFECF7FB);
  static const Color textformfieldBorderColor = Color(0xFFA9C5CF);
  static const Color locationColor=Colors.red;
  static const Color accentColor=Color(0xFFD3E3EB);
  static const Color secondaryTextColor=Color(0xFF8e9497);
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: bgColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF22577A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    wordSpacing: 2.0,
                    letterSpacing: 2.0
                ),
                fixedSize: Size(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.93,
                    MediaQuery
                        .of(context)
                        .size
                        .height * 0.07
                )
            )
        ),
        scaffoldBackgroundColor: bgColor,
        iconTheme: const IconThemeData(
            color: primaryColor
        ),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
              color: AppTheme.primaryColor
          ),
        contentPadding: EdgeInsets.all(20.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
                color: textformfieldBorderColor
            ),
        ),
      )

    );
  }
}