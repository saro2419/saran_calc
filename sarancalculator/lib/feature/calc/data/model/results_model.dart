import 'package:equatable/equatable.dart';
import 'package:sarancalculator/feature/calc/domain/entity/results_entity.dart';

class ResultsModel extends ResultsEntity with EquatableMixin {
  ResultsModel({required super.expression, required super.result});

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(expression: json['expression'], result: json['result']);
  }

  Map<String, dynamic> toJson() {
    return {'expression': expression, 'result': result};
  }

  factory ResultsModel.fromEntity(ResultsEntity entity){
    return ResultsModel(expression: entity.expression, result: entity.result);
  }

  ResultsEntity toEntity(){
    return ResultsEntity(expression: expression, result: result);
  }

  @override
  List<Object?> get props => [expression,result];
}
