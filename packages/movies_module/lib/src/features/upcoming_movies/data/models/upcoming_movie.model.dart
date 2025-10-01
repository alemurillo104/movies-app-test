import '../../domain/entities/upcoming_movie.entity.dart';

class UpcomingMovieModel extends UpcomingMovieEntity {
  UpcomingMovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.popularity,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
    required super.originalTitle,
    super.posterPath,
    super.backdropPath,
    required super.originalLanguage,
    required super.voteCount,
    required super.adult,
    required super.video,
  });

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      genreIds: List<int>.from(json['genre_ids'] as List),
      originalTitle: json['original_title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      originalLanguage: json['original_language'] as String,
      voteCount: json['vote_count'] as int,
      adult: json['adult'] as bool,
      video: json['video'] as bool,
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
      'original_title': originalTitle,
      'original_language': originalLanguage,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'video': video,
      'vote_count': voteCount,
    };
  }
}
