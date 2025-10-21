import 'package:sarancalculator/feature/calc/domain/entity/results_entity.dart';

abstract class ResultsRepository {
  Future<ResultsEntity> getResult(String expression);
}