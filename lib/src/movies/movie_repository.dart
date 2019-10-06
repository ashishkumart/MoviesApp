import 'package:movies_app/networking/api_base_helper.dart';
import 'package:movies_app/networking/response/movie_response.dart';

class MovieRepository {
  final _apiKey = '4ce613c29769e6f1c1b5439229d5a3eb';
  ApiBaseHelper _apiHelper = ApiBaseHelper();

  Future<List<Movie>> fetchPopularMovieList() async {
    final response = await _apiHelper.get("/movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}
