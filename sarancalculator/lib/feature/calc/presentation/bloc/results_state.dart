import 'package:equatable/equatable.dart';

class ResultsState extends Equatable {
  final String expression;
  final String result;
  final bool isLoading;
  final String errorMessage;

  const ResultsState({
    this.expression = '',
    this.result = '',
    this.isLoading = false,
    this.errorMessage = '',
  });

  ResultsState copyWith({
    String? expression,
    String? result,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ResultsState(
      expression: expression ?? this.expression,
      result: result ?? this.result,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [expression, result, isLoading, errorMessage];
}
