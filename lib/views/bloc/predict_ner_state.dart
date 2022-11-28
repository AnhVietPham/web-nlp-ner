import '../../domain/result_ner_entity.dart';

class PredictNerState {}

class PredictNerInitState extends PredictNerState {}

class PredictNerLoadingState extends PredictNerState {}

class PredictNerSuccessState extends PredictNerState {
  final ResultNerEntity data;

  PredictNerSuccessState(this.data);
}

class Error extends PredictNerState {}
