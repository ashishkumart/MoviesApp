import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/networking/response/movie_response.dart';

abstract class PopularMovieState extends Equatable {
  PopularMovieState([List props = const []]) : super(props);
}

class MoviesLoading extends PopularMovieState {}

class MoviesLoaded extends PopularMovieState {
  final List<Movie> movies;

  MoviesLoaded({@required this.movies}) : super([movies]);
}

class MovieLoadingFailure extends PopularMovieState {
  final String message;

  MovieLoadingFailure({@required this.message}) : super([message]);
}
