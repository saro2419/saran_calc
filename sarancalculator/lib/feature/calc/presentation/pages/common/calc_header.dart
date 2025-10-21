import 'package:flutter/material.dart';
import 'package:sarancalculator/common/constants/color_constant.dart';
import 'package:sarancalculator/common/constants/fontsize_constant.dart';

class CalcHeader extends StatelessWidget {
  final double? fontSize;
  const CalcHeader({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    // Text to display
    const text = '<<< Kanakku Podu >>>';

    // Define a list of colors to apply for each character
    final colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.cyan,
      Colors.teal,
      Colors.amber,
      Colors.lime,
    ];

    return RichText(
      text: TextSpan(
        children: List.generate(text.length, (index) {
          final char = text[index];
          final color = colors[index % colors.length]; // cycle colors
          return TextSpan(
            text: char,
            style: TextStyle(
              fontSize: fontSize ?? PageHeading.small,
              fontWeight: FontWeight.bold,
              color: char == ' ' ? ColorConstant.white : color,
            ),
          );
        }),
      ),
    );
  }
}
