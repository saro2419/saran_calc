import 'package:sarancalculator/feature/calc/data/model/results_model.dart';

abstract class ResultsLocalDatasource {
  Future<ResultsModel> getResults();
}
