import '../../domain/entity/results_entity.dart';

class ResultsModel extends ResultsEntity {
  ResultsModel({required super.result});

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(result: json['result']);
  }

  Map<String, dynamic> toJson() {
    return {'result': result};
  }
}
