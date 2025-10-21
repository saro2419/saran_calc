import 'package:sarancalculator/feature/calc/data/repository/results_repository.dart';
import 'package:sarancalculator/feature/calc/domain/repository/results_repository_impl.dart';
import 'package:sarancalculator/feature/calc/domain/usecase/get_results_usecase.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_bloc.dart';

import 'init_dependencies.dart';

Future<void> initDependenciesMain() async {
  initGetResults();
}

/// Initializes all dependencies related to Results feature
void initGetResults() {
  // DataSources
  // serviceLocator.registerLazySingleton<ResultsLocalDatasource>(
  //   () => ResultsLocalDatasourceImpl(),
  // );
  // serviceLocator.registerLazySingleton<ResultsRemoteDatasource>(
  //   () => ResultsRemoteDatasourceImpl(),
  // );

  // Repository
  serviceLocator.registerLazySingleton<ResultsRepository>(
    () => ResultsRepositoryImpl(),
  );

  // UseCase
  serviceLocator.registerLazySingleton<GetResultsUsecase>(
    () => GetResultsUsecase(repository: serviceLocator<ResultsRepository>()),
  );

  // Bloc
  serviceLocator.registerFactory<ResultsBloc>(
    () => ResultsBloc(usecase: serviceLocator<GetResultsUsecase>()),
  );
}
