import 'genre.entity.dart';
import 'production_company.entity.dart';

class MovieDetailEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final String tagline;
  final int budget;
  final int revenue;
  final String homepage;
  final List<GenreEntity> genres;
  final List<ProductionCompanyEntity> productionCompanies;

  const MovieDetailEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.tagline,
    required this.budget,
    required this.revenue,
    required this.homepage,
    required this.genres,
    required this.productionCompanies,
  });
}
