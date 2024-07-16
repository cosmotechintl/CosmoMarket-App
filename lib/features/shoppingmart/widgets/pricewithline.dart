import 'package:flutter/Material.dart';
class PriceWithLine extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;
  final double fontSize;
  final double lineHeight;

  PriceWithLine({
    required this.text,
    required this.lineColor,
    required this.textColor,
    required this.fontSize,
    required this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Text with color
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: lineHeight,
              color: lineColor,
            ),
          ),
        ),
      ],
    );
  }
}