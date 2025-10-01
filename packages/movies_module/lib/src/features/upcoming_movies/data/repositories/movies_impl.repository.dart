import '../datasources/remote.datasource.dart';
import '../../domain/entities/movie_detail.entity.dart';
import '../../domain/entities/upcoming_movie.entity.dart';
import '../../domain/entities/trending_movie.entity.dart';
import '../../domain/repositories/movies.repository.dart';
import '../../domain/entities/top_rated_movie.entity.dart';

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

  @override
  Future<List<TrendingMovieEntity>> retrieveTopTrendMovies() async {
    return await _dataSource.retrieveTopTrendMovies();
  }

  @override
  Future<List<TopRatedMovieEntity>> retrieveTopRatedMovies() async {
    return await _dataSource.retrieveTopRatedMovies();
  }

  @override
  Future<MovieDetailEntity> retrieveMovieDetail(int id) async {
    return await _dataSource.retrieveMovieDetail(id);
  }
}
