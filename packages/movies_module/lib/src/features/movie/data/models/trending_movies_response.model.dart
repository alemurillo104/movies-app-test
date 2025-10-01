import 'trending_movie.model.dart';

class TrendingMoviesResponse {
  final int page;
  final List<TrendingMovieModel> results;
  final int totalPages;
  final int totalResults;

  TrendingMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingMoviesResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultsList = json['results'] as List<dynamic>;
    final List<TrendingMovieModel> movies = resultsList
        .map((i) => TrendingMovieModel.fromJson(i as Map<String, dynamic>))
        .toList();

    return TrendingMoviesResponse(
      page: json['page'] as int,
      results: movies,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}
