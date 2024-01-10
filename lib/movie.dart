class Movie{
  late String title;
  late String backDropPath;
  late String originalTitle;
  late String overview;
  late String posterPath;
  late String releaseDate;
  late double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String , dynamic> json){
    return Movie(
      title: json['title'].toString(),
      backDropPath: json['backdrop_path'].toString(),
      originalTitle: json['original_title'].toString(),
      overview: json['overview'].toString(),
      posterPath: json['poster_path'].toString(),
      releaseDate: json['release_date'].toString(),
      voteAverage: json['vote_average'].toDouble(),
    );
  }

}