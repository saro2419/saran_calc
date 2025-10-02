import 'package:flutter/material.dart';
import 'package:sarancalculator/common/constants/spacing_constant.dart';
import 'package:sarancalculator/feature/calc/presentation/pages/common/calc_header.dart';
import 'package:sarancalculator/feature/calc/presentation/pages/common/calc_value_button.dart';
import 'package:sarancalculator/feature/calc/presentation/pages/common/calc_value_field.dart';
import 'package:sarancalculator/widgets/parent/custom_container.dart';

class MobileCalcView extends StatefulWidget {
  const MobileCalcView({super.key});

  @override
  State<MobileCalcView> createState() => _MobileCalcViewState();
}

class _MobileCalcViewState extends State<MobileCalcView> {
  final TextEditingController _valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomContainer(
        child: Padding(
          padding: const EdgeInsets.all(SpacingConstant.mdx),
          child: Column(
            spacing: SpacingConstant.smd,
            children: [
              CalcHeader(text: 'Kanakku Podu'),

              CalcValueField(controller: _valueController),

              SizedBox(height: SpacingConstant.sm),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingConstant.sm,
                ),
                child: Column(
                  spacing: SpacingConstant.xl,
                  children: [
                    //1st row (1,2,3)
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '1', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '2', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '3', onPressed: () {}),
                        ),
                      ],
                    ),

                    //2nd row (4,5,6)
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '4', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '5', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '6', onPressed: () {}),
                        ),
                      ],
                    ),

                    //3rd row (7,8,9)
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '7', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '8', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '9', onPressed: () {}),
                        ),
                      ],
                    ),

                    //4th row (=,+)
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CalcValueButton(value: '=', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '+', onPressed: () {}),
                        ),
                      ],
                    ),

                    //5th row (/,*,-)
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '/', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '*', onPressed: () {}),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CalcValueButton(value: '-', onPressed: () {}),
                        ),
                      ],
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
