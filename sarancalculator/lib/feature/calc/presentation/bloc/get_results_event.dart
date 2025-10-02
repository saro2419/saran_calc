import 'package:equatable/equatable.dart';

abstract class GetResultsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchResultsEvent extends GetResultsEvent {}
