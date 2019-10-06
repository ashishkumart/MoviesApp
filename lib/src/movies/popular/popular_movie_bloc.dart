import 'package:bloc/bloc.dart';
import 'package:movies_app/networking/response/movie_response.dart';
import 'package:movies_app/src/movies/movie_repository.dart';
import 'package:movies_app/src/movies/popular/popular_movie_event.dart';
import 'package:movies_app/src/movies/popular/popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  MovieRepository _movieRepository;

  PopularMovieBloc() {
    _movieRepository = MovieRepository();
  }

  @override
  PopularMovieState get initialState => MoviesLoading();

  @override
  Stream<PopularMovieState> mapEventToState(PopularMovieEvent event) async* {
    if (event is PopularTabPressed) {
      try {
        List<Movie> movies = await _movieRepository.fetchPopularMovieList();
        yield MoviesLoaded(movies: movies);
      } catch (e) {
        yield MovieLoadingFailure(message: e.toString());
      }
    }
  }
}
