import 'package:common_module/common_module.dart';
import '../models/upcoming_movie_response.model.dart';
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
}
