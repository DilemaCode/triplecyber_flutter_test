import 'package:triplecyber_test/modules/movies/data/datasource/movies.datasource.dart';
import 'package:triplecyber_test/modules/movies/data/models/movie.response.model.dart';

class MoviesRepository {
  MoviesDatasource moveisDS = MoviesDatasource();

  Future<MovieResModel> getMovies() async {
    Map<String, dynamic> res = await moveisDS.getMovies();
    return MovieResModel.fromJson(res);
  }
}
