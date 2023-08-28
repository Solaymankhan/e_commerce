part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomeSearchTapState extends HomePageState{
  bool is_search_taped;
  HomeSearchTapState(this.is_search_taped);
}
