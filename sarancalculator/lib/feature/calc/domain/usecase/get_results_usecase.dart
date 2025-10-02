import 'package:sarancalculator/feature/calc/data/repository/results_repository.dart';

import '../entity/results_entity.dart';

class GetResultsUsecase {
  final ResultsRepository repository;

  GetResultsUsecase(this.repository);

  Future<ResultsEntity> call() async {
    return await repository.getResults();
  }
}
