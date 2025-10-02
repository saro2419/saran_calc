import 'package:equatable/equatable.dart';
import '../../domain/entity/results_entity.dart';

abstract class GetResultsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResultsInitial extends GetResultsState {}

class ResultsLoading extends GetResultsState {}

class ResultsLoaded extends GetResultsState {
  final ResultsEntity results;

  ResultsLoaded(this.results);

  @override
  List<Object?> get props => [results];
}

class ResultsError extends GetResultsState {
  final String message;

  ResultsError(this.message);

  @override
  List<Object?> get props => [message];
}
