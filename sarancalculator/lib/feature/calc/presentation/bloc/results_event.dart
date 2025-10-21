import 'package:equatable/equatable.dart';

abstract class ResultsEvent extends Equatable{
  const ResultsEvent();

  @override
  List<Object?> get props => [];
}

class ResultsInitial extends ResultsEvent{}

class ButtonPressed extends ResultsEvent{
  final String value;

  const ButtonPressed({required this.value});

  @override
  List<Object?> get props => [value];
}

class DeleteButtonPressed extends ResultsEvent{
  const DeleteButtonPressed();
}

class ClearButtonPressed extends ResultsEvent{
  const ClearButtonPressed();
}

class EvaluateButtonPressed extends ResultsEvent{
  const EvaluateButtonPressed();
}