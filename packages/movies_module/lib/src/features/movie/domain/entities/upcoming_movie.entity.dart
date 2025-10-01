class UpcomingMovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final double popularity;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final String? posterPath;
  final String? backdropPath;
  final String originalLanguage;
  final int voteCount;
  final bool adult;
  final bool video;

  UpcomingMovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
    this.posterPath,
    this.backdropPath,
    required this.originalLanguage,
    required this.voteCount,
    required this.adult,
    required this.video,
  });
}
