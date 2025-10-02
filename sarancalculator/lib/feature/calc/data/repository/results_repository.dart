import '../../domain/entity/results_entity.dart';

abstract class ResultsRepository {
  Future<ResultsEntity> getResults();
}
