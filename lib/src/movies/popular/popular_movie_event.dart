import 'package:equatable/equatable.dart';

abstract class PopularMovieEvent extends Equatable {
  PopularMovieEvent([List props = const []]) : super(props);
}

class PopularTabPressed extends PopularMovieEvent {}
