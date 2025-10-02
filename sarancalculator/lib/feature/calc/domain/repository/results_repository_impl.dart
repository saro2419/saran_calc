import '../../data/repository/results_repository.dart';
import '../entity/results_entity.dart';
import '../../data/datasource/results_local_datasource.dart';
import '../../data/datasource/results_remote_datasource.dart';

class ResultsRepositoryImpl implements ResultsRepository {
  final ResultsLocalDatasource local;
  final ResultsRemoteDatasource remote;

  ResultsRepositoryImpl({required this.local, required this.remote});

  @override
  Future<ResultsEntity> getResults() async {
    try {
      return await remote.getResults();
    } catch (_) {
      return await local.getResults();
    }
  }
}
