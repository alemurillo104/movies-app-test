import 'genre.model.dart';
import 'spoken_languages.model.dart';
import 'production_company.model.dart';
import '../../domain/entities/movie_detail.entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    super.posterPath,
    super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
    required super.tagline,
    required super.budget,
    required super.revenue,
    required super.homepage,
    required super.genres,
    required super.productionCompanies,
    required super.spokenLanguages,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    final genres = (json['genres'] as List)
        .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final companies = (json['production_companies'] as List)
        .map((e) => ProductionCompanyModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final spokenLanguages = (json['spoken_languages'] as List)
        .map((sl) => SpokenLanguageModel.fromJson(sl as Map<String, dynamic>))
        .toList();

    return MovieDetailModel(
      id: json['id'] as int,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      runtime: json['runtime'] as int,
      tagline: json['tagline'] as String,
      budget: json['budget'] as int,
      revenue: json['revenue'] as int,
      homepage: json['homepage'] as String,
      genres: genres,
      productionCompanies: companies,
      spokenLanguages: spokenLanguages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'runtime': runtime,
      'vote_average': voteAverage,
      'release_date': releaseDate,
      'budget': budget,
      'revenue': revenue,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'tagline': tagline,
      'homepage': homepage,
      'genres': genres
          .map(
            (genre) => (genre as GenreModel).toJson(),
          )
          .toList(),
      'production_companies': productionCompanies
          .map((company) => (company as ProductionCompanyModel).toJson())
          .toList(),
      'spoken_languages': spokenLanguages
          .map((sl) => (sl as SpokenLanguageModel).toJson())
          .toList(),
    };
  }
}
