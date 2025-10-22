import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarancalculator/common/constants/color_constant.dart';
import 'package:sarancalculator/common/constants/fontsize_constant.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_bloc.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_state.dart';
import 'package:sarancalculator/feature/calc/presentation/pages/common/calc_history_dialog.dart';

class CalcHeader extends StatelessWidget {
  final double? fontSize;
  const CalcHeader({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    // Text to display
    const text = 'Kanakku Podu';

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: SizedBox()),
        Expanded(
          flex: 7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
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
              ),
            ],
          ),
        ),
        BlocBuilder<ResultsBloc, ResultsState>(
          builder: (context, state) {
            final hasHistory = state.historyList.isNotEmpty;

            return Expanded(
              child: InkWell(
                onTap: hasHistory
                    ? () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) =>
                              HistoryDialog(history: state.historyList),
                        );
                      }
                    : null,
                child: Icon(
                  Icons.history,
                  color: hasHistory
                      ? ColorConstant.secondary
                      : ColorConstant.grey,
                  size: 30,
                ), // disable tap if empty
              ),
            );
          },
        ),
      ],
    );
  }
}
