import '../entities/trending_movie.entity.dart';
import '../entities/upcoming_movie.entity.dart';
import '../entities/top_rated_movie.entity.dart';

abstract class MoviesRepository {
  Future<List<UpcomingMovieEntity>> retrieveUpcomingMovies();
  Future<List<TrendingMovieEntity>> retrieveTopTrendMovies();
  Future<List<TopRatedMovieEntity>> retrieveTopRatedMovies();
}
