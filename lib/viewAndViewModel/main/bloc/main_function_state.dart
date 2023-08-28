part of 'main_function_bloc.dart';

@immutable
abstract class MainFunctionState {}

class MainFunctionInitial extends MainFunctionState {}

class MainFuncBottomNavigationClickState extends MainFunctionState{
  int index;
  MainFuncBottomNavigationClickState(this.index);
}