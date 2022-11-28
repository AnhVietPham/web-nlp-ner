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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PredictNerBloc>(
      create: (_) => sl<PredictNerBloc>(),
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (String value) async {
                sl<PredictNerBloc>().add(PredictNerInputTextEvent(value));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<PredictNerBloc, PredictNerState>(
                buildWhen: (previous, current) {
              return current is PredictNerLoadingState;
            }, builder: (context, state) {
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
