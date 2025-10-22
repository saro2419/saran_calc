import 'package:equatable/equatable.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_bloc.dart';

class ResultsState extends Equatable {
  final String expression;
  final String result;
  final bool isLoading;
  final String errorMessage;
  final List<HistoryItem> historyList;

  const ResultsState({
    this.expression = '',
    this.result = '',
    this.isLoading = false,
    this.errorMessage = '',
    this.historyList = const [],
  });

  ResultsState copyWith({
    String? expression,
    String? result,
    bool? isLoading,
    String? errorMessage,
    List<HistoryItem>? historyList,
  }) {
    return ResultsState(
      expression: expression ?? this.expression,
      result: result ?? this.result,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      historyList: historyList ?? this.historyList,
    );
  }

  @override
  List<Object?> get props => [
    expression,
    result,
    isLoading,
    errorMessage,
    historyList,
  ];
}
