part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class HomeSearchTapEvent extends HomePageEvent{
  bool is_search_taped;
  HomeSearchTapEvent(this.is_search_taped);
}
