import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_function_event.dart';
part 'main_function_state.dart';

class MainFunctionBloc extends Bloc<MainFunctionEvent, MainFunctionState> {
  MainFunctionBloc() : super(MainFunctionInitial()) {
    on<MainFuncBottomNavigationClickEvent>(mainFuncBottomNavigationClickEvent);
  }

  FutureOr<void> mainFuncBottomNavigationClickEvent(MainFuncBottomNavigationClickEvent event, Emitter<MainFunctionState> emit) {
    emit(MainFuncBottomNavigationClickState(event.index));
  }
}
