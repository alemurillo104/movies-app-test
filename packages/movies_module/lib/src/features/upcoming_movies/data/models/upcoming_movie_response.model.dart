import 'upcoming_movie.model.dart';
import '../../domain/entities/upcoming_movies.entity.dart';

class UpcomingMoviesResponse {
  final int page;
  final List<UpcomingMovieModel> results;
  final int totalPages;
  final int totalResults;
  final String maximumDate;
  final String minimumDate;

  UpcomingMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
    required this.maximumDate,
    required this.minimumDate,
  });

  factory UpcomingMoviesResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultsList = json['results'] as List<dynamic>;
    final List<UpcomingMovieModel> movies = resultsList
        .map((i) => UpcomingMovieModel.fromJson(i as Map<String, dynamic>))
        .toList();

    final Map<String, dynamic> dates = json['dates'] as Map<String, dynamic>;

    return UpcomingMoviesResponse(
      page: json['page'] as int,
      results: movies,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      maximumDate: dates['maximum'] as String,
      minimumDate: dates['minimum'] as String,
    );
  }

  UpcomingMoviesEntity toEntity() {
    return UpcomingMoviesEntity(
      maximumDate: maximumDate,
      minimumDate: minimumDate,
      movies: results,
    );
  }
}
