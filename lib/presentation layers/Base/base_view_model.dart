// this is Based View Model this is class have any variable or function will be used through any view model
import 'dart:async';

import 'package:advanced_arabic_mina_course/presentation%20layers/common/state_renderer_folder/state_renderer_imp.dart';

abstract class BasedViewModel extends BaseViewModelInput
    with BasedViewModelOutput {
  final StreamController _inputStreamController = StreamController<
      FlowState>.broadcast(); // .brodcast for make alot of listen in the same time and don't make any error

  @override
  void dispose() {
    _inputStreamController.close();
  }

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);
}

// this is based for any event or any click fuction or variable
abstract class BaseViewModelInput {
  void start(); // start viewModel jobs

  void dispose(); // will be import or called when view model dies

  Sink get inputState;
}

// this is based for any output from any api and have it from based input value will be excute from viewModel and will send for view
mixin BasedViewModelOutput {
  Stream<FlowState> get outputState;
}
