
import 'package:triplecyber_test/modules/movies/data/models/movie.model.dart';

class MovieResModel {
  late int page;
  late List<MovieModel> results;

  MovieResModel({
   required this.page,
   required this.results,
  });

  MovieResModel.fromJson(Map<String, dynamic> json) {
    try {
    page = json['page'];
    results = movieModelFromJsonList(json['results']);
    } catch (e) {
      print(e);
    }
  }
}

