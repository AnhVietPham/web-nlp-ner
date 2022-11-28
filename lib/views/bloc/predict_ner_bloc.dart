import 'package:dartz/dartz.dart';
import 'package:demoner/views/bloc/predict_ner_event.dart';
import 'package:demoner/views/bloc/predict_ner_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/error/failures.dart';
import '../../domain/predict_ner_use_case.dart';
import '../../domain/result_ner_entity.dart';

class PredictNerBloc extends Bloc<PredictNerEvent, PredictNerState> {
  final PredictNerUseCase predictNerUseCase;

  PredictNerBloc({required PredictNerUseCase predictNerUseCase})
      : this.predictNerUseCase = predictNerUseCase,
        super(PredictNerInitState());

  @override
  Stream<PredictNerState> mapEventToState(PredictNerEvent event) async* {
    if (event is PredictNerInputTextEvent) {
      yield PredictNerLoadingState();
      // final data = await predictNerUseCase.call(event.text);
      // yield* _mapToPredictNerSuccessState(data);
    }
  }

  Stream<PredictNerState> _mapToPredictNerSuccessState(
      Either<Failure, ResultNerEntity> entity) async* {
    yield entity.fold(
            (l) => Error(),
            (data) {
              var result = data;
      return PredictNerSuccessState(result);
    });
  }
}
