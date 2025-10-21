import 'package:flutter/material.dart';
import 'package:sarancalculator/common/constants/color_constant.dart';
import 'package:sarancalculator/common/constants/fontsize_constant.dart';
import 'package:sarancalculator/common/constants/radius_constant.dart';

class CalcValueButton extends StatelessWidget {
  final String value;
  final VoidCallback onPressed;
  const CalcValueButton({
    super.key,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      splashColor: ColorConstant.white,
      child: Container(
        height: screenHeight * 0.067,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorConstant.white,
              blurRadius: 7,
              spreadRadius: 1,
              offset: Offset(0, 0), // subtle shadow below the container
            ),
          ],
          borderRadius: BorderRadius.circular(RadiusConstant.lg),
          gradient: LinearGradient(
            colors: [ColorConstant.primary, ColorConstant.background],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: PageSubHeading.small,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
