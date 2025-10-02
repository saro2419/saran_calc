import 'package:flutter/material.dart';
import 'package:sarancalculator/common/constants/color_constant.dart';
import 'package:sarancalculator/common/constants/fontsize_constant.dart';

class CalcHeader extends StatelessWidget {
  final double? fontSize;
  final String text;
  const CalcHeader({super.key, this.fontSize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: FontsizeConstant.xl,
        fontWeight: FontWeight.bold,
        color: ColorConstant.secondary,
      ),
    );
  }
}
