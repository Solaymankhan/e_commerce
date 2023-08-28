part of 'main_function_bloc.dart';

@immutable
abstract class MainFunctionEvent {}


class MainFuncBottomNavigationClickEvent extends MainFunctionEvent{
  int index;
  MainFuncBottomNavigationClickEvent(this.index);
}
