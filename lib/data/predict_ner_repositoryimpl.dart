import 'package:dartz/dartz.dart';
import 'package:demoner/data/predict_ner_remote_data_source.dart';
import 'package:demoner/data/predict_ner_response.dart';
import 'package:demoner/domain/predict_ner_repository.dart';
import 'package:demoner/domain/result_ner_entity.dart';

import '../base/error/exceptions.dart';
import '../base/error/failures.dart';
import '../domain/result_ner_entity.dart';

class PredictNerRepositoryImpl extends  PredictNerRepository {
  final PredictNerRemoteDataSource predictNerRemoteDataSource;

  PredictNerRepositoryImpl(this.predictNerRemoteDataSource);
  @override
  Future<Either<Failure, ResultNerEntity>> predictNer(String text) async {
    try {
      final data = await predictNerRemoteDataSource.predictNer(text);
      return Right(_mapResultNerEntity(data));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  ResultNerEntity _mapResultNerEntity(PredictNerResponse response){
    final List<ResultEntity> results = [];
    response.result?.data?.forEach((element) {
      results.add(ResultEntity(element.token ?? "", element.label ?? ""));
    });
    return ResultNerEntity(results);
  }

}