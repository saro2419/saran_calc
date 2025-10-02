import 'package:sarancalculator/feature/calc/data/model/results_model.dart';

abstract class ResultsRemoteDatasource {
  Future<ResultsModel> getResults();
}
