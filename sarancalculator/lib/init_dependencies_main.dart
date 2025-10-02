import 'package:sarancalculator/feature/calc/data/datasource/results_local_datasource.dart';
import 'package:sarancalculator/feature/calc/data/datasource/results_local_datasource_impl.dart';
import 'package:sarancalculator/feature/calc/data/datasource/results_remote_datasource.dart';
import 'package:sarancalculator/feature/calc/data/datasource/results_remote_datasource_impl.dart';
import 'package:sarancalculator/feature/calc/data/repository/results_repository.dart';
import 'package:sarancalculator/feature/calc/domain/repository/results_repository_impl.dart';
import 'package:sarancalculator/feature/calc/domain/usecase/get_results_usecase.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/get_results_bloc.dart';

import 'init_dependencies.dart';

Future<void> initDependenciesMain() async {
  initGetResults();
}

/// Initializes all dependencies related to Results feature
void initGetResults() {
  // DataSources
  serviceLocator.registerLazySingleton<ResultsLocalDatasource>(
    () => ResultsLocalDatasourceImpl(),
  );
  serviceLocator.registerLazySingleton<ResultsRemoteDatasource>(
    () => ResultsRemoteDatasourceImpl(),
  );

  // Repository
  serviceLocator.registerLazySingleton<ResultsRepository>(
    () => ResultsRepositoryImpl(
      local: serviceLocator(),
      remote: serviceLocator(),
    ),
  );

  // UseCase
  serviceLocator.registerLazySingleton<GetResultsUsecase>(
    () => GetResultsUsecase(serviceLocator<ResultsRepository>()),
  );

  // Bloc
  serviceLocator.registerFactory<GetResultsBloc>(
    () => GetResultsBloc(serviceLocator<GetResultsUsecase>()),
  );
}
