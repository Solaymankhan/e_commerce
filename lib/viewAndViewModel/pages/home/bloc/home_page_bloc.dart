import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomeSearchTapEvent>(homeSearchTapEvent);
  }

  FutureOr<void> homeSearchTapEvent(HomeSearchTapEvent event, Emitter<HomePageState> emit) {
    emit(HomeSearchTapState(event.is_search_taped));
  }
}
