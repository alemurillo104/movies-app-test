import '../../domain/entities/top_rated_movie.entity.dart';

class TopRatedMovieModel extends TopRatedMovieEntity {
  const TopRatedMovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.popularity,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
    required super.adult,
    required super.originalTitle,
    required super.originalLanguage,
    super.posterPath,
    super.backdropPath,
    required super.video,
    required super.voteCount,
  });

  factory TopRatedMovieModel.fromJson(Map<String, dynamic> json) {
    return TopRatedMovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      genreIds: List<int>.from(json['genre_ids'] as List),
      adult: json['adult'] as bool,
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      video: json['video'] as bool,
      voteCount: json['vote_count'] as int,
    );
  }
}
