import 'package:common_module/common_module.dart';
import '../models/upcoming_movie_response.model.dart';
import '../models/trending_movies_response.model.dart';
import '../../domain/entities/trending_movie.entity.dart';
import '../../domain/entities/upcoming_movies.entity.dart';

class RemoteMoviesDataSource {
  final DioClient _client = DioClient();

  Future<UpcomingMoviesEntity> retrieveUpcomingMovies() async {
    try {
      final response = await _client.get('/movie/upcoming');

      final upcomingResponse = UpcomingMoviesResponse.fromJson(response.data);

      return upcomingResponse.toEntity();
    } catch (e) {
      throw Exception('Error al obtener próximos estrenos: $e');
    }
  }

  Future<List<TrendingMovieEntity>> retrieveTopTrendMovies() async {
    try {
      final response = await _client.get('/trending/movie/day');
      final trendingResponse = TrendingMoviesResponse.fromJson(response.data);
      return trendingResponse.results;
    } catch (e) {
      throw Exception('Error al obtener películas en tendencia: $e');
    }
  }
}
