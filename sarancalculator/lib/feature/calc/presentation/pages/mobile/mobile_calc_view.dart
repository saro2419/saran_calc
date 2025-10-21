import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarancalculator/common/constants/spacing_constant.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_bloc.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_event.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_state.dart';
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
  void initState() {
    super.initState();
    context.read<ResultsBloc>().add(ResultsInitial());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomContainer(
        child: Padding(
          padding: const EdgeInsets.all(SpacingConstant.md),
          child: Column(
            children: [
              // Header section (small)
              Expanded(flex: 1, child: Center(child: CalcHeader())),

              // Value field section (medium)
              Expanded(
                flex: 4,
                child: BlocBuilder<ResultsBloc, ResultsState>(
                  builder: (context, state) {
                    final double? parsed = double.tryParse(state.result);
                    final String formattedValue = parsed != null
                        ? parsed
                              .toStringAsFixed(10)
                              .replaceFirst(RegExp(r'\.?0+$'), '')
                        : state.result;

                    final String value = state.result.isNotEmpty
                        ? '${state.expression}\n= $formattedValue'
                        : state.expression;

                    _valueController.text = value;
                    return Center(
                      child: CalcValueField(controller: _valueController),
                    );
                  },
                ),
              ),

              // Keypad section (large)
              Expanded(
                flex: 14,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final rowHeight = constraints.maxHeight / 7;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButtonRow(
                          values: ['1', '2', '+'],
                          rowHeight: rowHeight,
                        ),
                        buildButtonRow(
                          values: ['3', '4', '-'],
                          rowHeight: rowHeight,
                        ),
                        buildButtonRow(
                          values: ['5', '6', '*'],
                          rowHeight: rowHeight,
                        ),
                        buildButtonRow(
                          values: ['7', '8', '/'],
                          rowHeight: rowHeight,
                        ),
                        buildButtonRow(
                          values: ['9', '0', '.'],
                          rowHeight: rowHeight,
                        ),
                        buildButtonRow(
                          values: ['(', ')', 'D'],
                          rowHeight: rowHeight,
                        ),
                        buildButtonRow(
                          values: ['CE', '='],
                          rowHeight: rowHeight,
                          evenRow: true,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonRow({
    required List<String> values,
    bool? evenRow = false,
    required double rowHeight,
  }) {
    final buttonRow = <Widget>[];

    for (int i = 0; i < values.length; i++) {
      final value = values[i];

      buttonRow.add(
        Expanded(
          flex: (value == '=' && evenRow == true) ? 5 : 2,
          child: CalcValueButton(
            value: value,
            onPressed: () {
              final resultBloc = context.read<ResultsBloc>();

              switch (value) {
                case '=':
                  resultBloc.add(EvaluateButtonPressed());
                  break;
                case 'D':
                  resultBloc.add(DeleteButtonPressed());
                  break;
                case 'CE':
                  resultBloc.add(ClearButtonPressed());
                  break;
                default:
                  resultBloc.add(ButtonPressed(value: value));
                  break;
              }
            },
          ),
        ),
      );

      if (i != values.length - 1) {
        buttonRow.add(Expanded(child: const SizedBox()));
      }
    }

    return SizedBox(
      height: rowHeight,
      child: Row(children: buttonRow),
    );
  }
}
