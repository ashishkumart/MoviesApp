import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  SearchState([List props = const []]) : super([props]);
}

class InitialState extends SearchState {}

class QueryResultLoaded extends SearchState {}

class ShowLoading extends SearchState {}

class HideLoading extends SearchState {}
