import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/networking/response/movie_response.dart';
import 'package:movies_app/src/common/common.dart';
import 'package:movies_app/src/movies/popular/popular_movie_bloc.dart';
import 'package:movies_app/src/movies/popular/popular_movie_event.dart';
import 'package:movies_app/src/movies/popular/popular_movie_state.dart';

class PopularMoviesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopularMoviesPageState();
  }
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  PopularMovieBloc _popularMovieBloc;

  _PopularMoviesPageState() {
    _popularMovieBloc = PopularMovieBloc();
    _popularMovieBloc.dispatch(PopularTabPressed());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieBloc, PopularMovieState>(
      builder: (context, state) {
        // Show loading
        if (state is MoviesLoading) {}

        // Show error
        if (state is MovieLoadingFailure) {}

        if (state is MoviesLoaded) {
          return MoviesListWidget(
            movies: state.movies,
          );
        }

        return LoadingIndicator();
      },
      bloc: _popularMovieBloc,
    );
  }
}

class MoviesListWidget extends StatelessWidget {
  final List<Movie> movies;

  const MoviesListWidget({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5 / 1.8,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w342${movies[index].posterPath}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        });
  }
}
