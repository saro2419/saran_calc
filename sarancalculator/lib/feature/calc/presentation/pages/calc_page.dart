import 'package:flutter/material.dart';
import 'package:sarancalculator/common/responsive_layout.dart';
import 'mobile/mobile_calc_view.dart';

class CalcPage extends StatelessWidget {
  const CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobile: MobileCalcView(),
        tablet: MobileCalcView(),
        desktop: MobileCalcView(),
        ultrahd: Placeholder(),
      ),
    );
  }
}
