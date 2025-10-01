import '../../domain/entities/trending_movie.entity.dart';

class TrendingMovieModel extends TrendingMovieEntity {
  TrendingMovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.popularity,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
    required super.adult,
    required super.mediaType,
    required super.originalTitle,
    required super.originalLanguage,
    super.posterPath,
    super.backdropPath,
    required super.video,
    required super.voteCount,
  });

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      genreIds: List<int>.from(json['genre_ids'] as List),
      adult: json['adult'] as bool,
      mediaType: json['media_type'] as String,
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      video: json['video'] as bool,
      voteCount: json['vote_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'popularity': popularity,
      'vote_average': voteAverage,
      'release_date': releaseDate,
      'genre_ids': genreIds,
      'adult': adult,
      'media_type': mediaType,
      'original_title': originalTitle,
      'original_language': originalLanguage,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'video': video,
      'vote_count': voteCount,
    };
  }
}
