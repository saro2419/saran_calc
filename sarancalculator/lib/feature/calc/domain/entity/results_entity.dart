import 'package:equatable/equatable.dart';

class ResultsEntity extends Equatable {
  final String expression;
  final String result;

  const ResultsEntity({required this.expression, required this.result});

  @override
  List<Object?> get props => [expression, result];
}
