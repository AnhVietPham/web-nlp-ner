import 'dart:io';

import 'package:demoner/views/bloc/predict_ner_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';
import 'bloc/predict_ner_bloc.dart';
import 'bloc/predict_ner_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController _controller;

  PredictNerBloc get bloc =>
      BlocProvider.of<PredictNerBloc>(context);

  BuildContext get currentContext => context;


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PredictNerBloc>(
      create: (BuildContext context) => bloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('NER TASK')),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (String value) async {
                bloc.add(PredictNerInputTextEvent(value));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<PredictNerBloc, PredictNerState>(
                builder: (context, state) {
              if (state is PredictNerLoadingState) {
                return Text("Anh Viet pham" * 100);
              } else {
                return const SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }
}
