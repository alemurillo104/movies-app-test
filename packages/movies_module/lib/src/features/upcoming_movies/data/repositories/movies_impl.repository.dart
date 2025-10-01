import '../datasources/remote.datasource.dart';
import '../../domain/entities/upcoming_movie.entity.dart';
import '../../domain/repositories/movies.repository.dart';

class MoviesImplRepository implements MoviesRepository {
  final RemoteMoviesDataSource _dataSource;

  MoviesImplRepository({
    required RemoteMoviesDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<UpcomingMovieEntity>> retrieveUpcomingMovies() async {
    final response = await _dataSource.retrieveUpcomingMovies();
    return response.movies;
  }
}
