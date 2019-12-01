import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super([props]);
}

class QuerySubmitted extends SearchEvent {
  final String query;

  QuerySubmitted({@required this.query}) : super([query]);
}
