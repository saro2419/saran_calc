import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_results_event.dart';
import 'get_results_state.dart';
import '../../domain/usecase/get_results_usecase.dart';

class GetResultsBloc extends Bloc<GetResultsEvent, GetResultsState> {
  final GetResultsUsecase getResultsUsecase;

  GetResultsBloc(this.getResultsUsecase) : super(ResultsInitial()) {
    on<FetchResultsEvent>((event, emit) async {
      emit(ResultsLoading());
      try {
        final results = await getResultsUsecase();
        emit(ResultsLoaded(results));
      } catch (e) {
        emit(ResultsError(e.toString()));
      }
    });
  }
}
