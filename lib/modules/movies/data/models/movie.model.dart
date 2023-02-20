List<MovieModel> movieModelFromJsonList(List data) {
  return data
      .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

class MovieModel {
  int? id;
  String? overview;
  String? posterPath;
  String? title;
  double? voteAverage;
  bool? isFavorite;

  MovieModel({
    this.id,
    this.overview,
    this.posterPath,
    this.title,
    this.voteAverage,
    this.isFavorite,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    title = json['title'];
    voteAverage = json['vote_average'];
    isFavorite = false;
  }
}
