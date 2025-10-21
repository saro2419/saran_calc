import 'package:math_expressions/math_expressions.dart';
import 'package:sarancalculator/feature/calc/data/model/results_model.dart';
import 'package:sarancalculator/feature/calc/data/repository/results_repository.dart';
import 'package:sarancalculator/feature/calc/domain/entity/results_entity.dart';

class ResultsRepositoryImpl implements ResultsRepository {
  @override
  Future<ResultsEntity> getResult(String expression) async {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel cm = ContextModel();
      final double answer = exp.evaluate(EvaluationType.REAL, cm);
      final model = ResultsModel(
        expression: expression,
        result: answer.toString(),
      );

      return model.toEntity();
    } catch (e) {
      throw Exception("Errrrorrrrr: $e");
    }
  }
}
