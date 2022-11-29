import 'package:flutter/material.dart';

import '../../domain/result_ner_entity.dart';

class PredictNerState {}

class PredictNerInitState extends PredictNerState {}

class PredictNerLoadingState extends PredictNerState {}

class PredictNerSuccessState extends PredictNerState {
  final List<WidgetSpan> widgetSpans;

  PredictNerSuccessState(this.widgetSpans);
}

class Error extends PredictNerState {}
