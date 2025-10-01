import 'package:common_module/common_module.dart';
import '../../../movie_detail/data/models/movie_detail.model.dart';
import '../../../movie_detail/domain/entities/movie_detail.entity.dart';
import '../../../trending_movies/domain/entities/trending_movie.entity.dart';
import '../../../upcoming_movies/domain/entities/upcoming_movies.entity.dart';
import '../../../top_rated_movies/domain/entities/top_rated_movie.entity.dart';
import '../../../upcoming_movies/data/models/upcoming_movie_response.model.dart';
import '../../../trending_movies/data/models/trending_movies_response.model.dart';
import '../../../top_rated_movies/data/models/top_rated_movie_response.model.dart';

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

  Future<List<TopRatedMovieEntity>> retrieveTopRatedMovies() async {
    try {
      final response = await _client.get('/movie/top_rated');

      final topRatedResponse = TopRatedMoviesResponse.fromJson(response.data);

      return topRatedResponse.toEntityList();
    } catch (e) {
      throw Exception('Error al obtener películas mejor valoradas: $e');
    }
  }

  Future<MovieDetailEntity> retrieveMovieDetail(int movieId) async {
    try {
      final response = await _client.get('/movie/$movieId');

      final detailModel = MovieDetailModel.fromJson(response.data);

      return detailModel;
    } catch (e) {
      throw Exception(
        'Error al obtener el detalle de la película $movieId: $e',
      );
    }
  }
}
