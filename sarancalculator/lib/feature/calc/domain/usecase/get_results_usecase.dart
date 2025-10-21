import 'package:sarancalculator/feature/calc/data/repository/results_repository.dart';
import 'package:sarancalculator/feature/calc/domain/entity/results_entity.dart';

class GetResultsUsecase {
  final ResultsRepository repository;

  GetResultsUsecase({required this.repository});

  Future<ResultsEntity> call(String expression) async{
    return await repository.getResult(expression);
  }
}