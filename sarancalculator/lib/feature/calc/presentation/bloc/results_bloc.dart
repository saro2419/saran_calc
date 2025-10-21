import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarancalculator/feature/calc/domain/usecase/get_results_usecase.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_event.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final GetResultsUsecase usecase;

  ResultsBloc({required this.usecase}) : super(ResultsState()) {
    on<ResultsInitial>(_onResultsInitial);
    on<ButtonPressed>(_onButtonPressed);
    on<DeleteButtonPressed>(_onDeleteButtonPressed);
    on<ClearButtonPressed>(_onClearButtonPressed);
    on<EvaluateButtonPressed>(_onEvaluateButtonPressed);
  }

  void _onResultsInitial(ResultsInitial event, Emitter<ResultsState> emit) {
    emit(
      ResultsState(
        expression: '',
        result: '',
        isLoading: false,
        errorMessage: '',
      ),
    );
  }

  void _onButtonPressed(ButtonPressed event, Emitter<ResultsState> emit) {
    final expression = state.expression + event.value;
    emit(state.copyWith(expression: expression));
  }

  void _onDeleteButtonPressed(
    DeleteButtonPressed event,
    Emitter<ResultsState> emit,
  ) {
    final expression = state.expression.substring(
      0,
      state.expression.length - 1,
    );
    emit(state.copyWith(expression: expression));
  }

  void _onClearButtonPressed(
    ClearButtonPressed event,
    Emitter<ResultsState> emit,
  ) {
    emit(
      ResultsState(
        expression: '',
        result: '',
        isLoading: false,
        errorMessage: '',
      ),
    );
  }

  void _onEvaluateButtonPressed(
    EvaluateButtonPressed event,
    Emitter<ResultsState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final expression = state.expression;

      final resultEntity = await usecase.call(expression);

      emit(state.copyWith(isLoading: false, result: resultEntity.result));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
