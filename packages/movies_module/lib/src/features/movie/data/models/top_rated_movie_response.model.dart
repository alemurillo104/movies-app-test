import 'top_rated_movie.model.dart';
import '../../domain/entities/top_rated_movie.entity.dart';

class TopRatedMoviesResponse {
  final int page;
  final List<TopRatedMovieModel> results;
  final int totalPages;
  final int totalResults;

  TopRatedMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedMoviesResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultsList = json['results'] as List<dynamic>;
    final List<TopRatedMovieModel> movies = resultsList
        .map((i) => TopRatedMovieModel.fromJson(i as Map<String, dynamic>))
        .toList();

    return TopRatedMoviesResponse(
      page: json['page'] as int,
      results: movies,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }

  List<TopRatedMovieEntity> toEntityList() {
    return results;
  }
}
