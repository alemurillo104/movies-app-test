class TopRatedMovieEntity {
  final int id;
  final String title;
  final String overview;
  final double popularity;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final bool adult;
  final String originalTitle;
  final String originalLanguage;
  final String? posterPath;
  final String? backdropPath;
  final bool video;
  final int voteCount;

  const TopRatedMovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
    required this.adult,
    required this.originalTitle,
    required this.originalLanguage,
    this.posterPath,
    this.backdropPath,
    required this.video,
    required this.voteCount,
  });
}
