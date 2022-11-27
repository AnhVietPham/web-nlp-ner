import 'package:demoner/views/bloc/predict_ner_event.dart';
import 'package:demoner/views/bloc/predict_ner_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictNerBloc extends Bloc<PredictNerEvent, PredictNerState> {
  PredictNerBloc(super.initialState);

  @override
  Stream<PredictNerState> mapEventToState(PredictNerEvent event) async* {
    if (event is PredictNerInputTextEvent){

    }
  }
}
